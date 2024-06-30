
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/bloc_status_enum.dart';
import '../../../../core/user_preferences/user_preferences.dart';
import 'my_tasks_event.dart';
import 'my_tasks_state.dart';
import '../../../../core/model/use_case_request_model.dart';
import '../../data/models/my_tasks_request_model.dart';
import '../../domain/entities/my_tasks_entity.dart';
import '../../domain/usecases/auth_check_usecase.dart';
import '../../domain/usecases/my_tasks_data_load_usecase.dart';

class MyTasksBloc extends Bloc<MyTasksEvent, MyTasksState> {
  MyTasksDataLoadUSeCase myTasksDataLoadUSeCase;
  AuthCheckUseCase authCheckUseCase;

  MyTasksBloc({
    required this.myTasksDataLoadUSeCase,
    required this.authCheckUseCase,
  }) : super(
          const MyTasksState(),
        ) {
    on<LoadMyTasksEvent>(loadQueryDataEvent);
    on<AuthCheckEvent>(authCheckEvent);
  }

  void authCheckEvent(AuthCheckEvent event, Emitter<MyTasksState> emit) async {
    emit(
      state.copyWith(authCheckStatus: BlocStatus.loading),
    );

    var response = await authCheckUseCase.call(params: null);
    response.fold(
        (fail) => emit(
              state.copyWith(
                authCheckStatus: BlocStatus.error,
                errorMsg: fail.message,
              ),
            ), (res) {
      if (res.hasAccess!) {
        emit(
          state.copyWith(
            authCheckStatus: BlocStatus.success,
            authCheckEntity: res,
          ),
        );
      } else {
        emit(
          state.copyWith(
            authCheckStatus: BlocStatus.error,
            errorMsg: res.message ?? 'Unauthorized Access',
          ),
        );
      }
    });
  }

  void loadQueryDataEvent(
    LoadMyTasksEvent event,
    Emitter<MyTasksState> emit,
  ) async {
    int eCode=await UserPreferences.getEmployeeCode();
    UseCaseRequestModel<MyTasksRequestModel> params = UseCaseRequestModel(
      query: {'pageNumber': event.pageNumber, 'limitPerPage': '12'},
      body: MyTasksRequestModel(resolverId: '$eCode'),
    );
    if (state.status.isLoading) return;
    var currentState = state;
    try {
      if (event.refresh ?? false) {
        print('anda');
        emit(
          state.copyWith(status: BlocStatus.loading),
        );

        var response = await myTasksDataLoadUSeCase.call(params: params);
        response.fold(
          (fail) => emit(
            state.copyWith(
              status: BlocStatus.error,
              errorMsg: fail.message,
            ),
          ),
          (res) => emit(
            state.copyWith(
              status: BlocStatus.success,
              myTasksEntity: res,
            ),
          ),
        );
      } else if (currentState.status.isInitial) {
        print('banda');
        emit(
          state.copyWith(status: BlocStatus.loading),
        );
        var response = await myTasksDataLoadUSeCase.call(params: params);
        response.fold(
            (fail) => emit(
                  state.copyWith(
                    status: BlocStatus.error,
                    errorMsg: fail.message,
                  ),
                ), (res) {
          int totalPages = (int.parse(
                    res.queriesCount[res.queriesCount.length - 1].value,
                  ) /
                  12)
              .ceil();
          emit(
            state.copyWith(
              status: BlocStatus.success,
              myTasksEntity: res,
              totalPages: totalPages,
            ),
          );
        });
      } else if (currentState.status.isSuccess) {
        print('canda');
        MyTasksEntity old = currentState.myTasksEntity!;

        var response = await myTasksDataLoadUSeCase.call(params: params);
        response.fold(
          (fail) => emit(
            state.copyWith(
              status: BlocStatus.error,
              errorMsg: fail.message,
            ),
          ),
          (res) => emit(
            state.copyWith(
              status: BlocStatus.success,
              myTasksEntity: MyTasksEntity(
                queries: [...old.queries, ...res.queries],
                queriesCount: res.queriesCount,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      state.copyWith(status: BlocStatus.error, errorMsg: 'Try Again Later');
    }
  }
}
