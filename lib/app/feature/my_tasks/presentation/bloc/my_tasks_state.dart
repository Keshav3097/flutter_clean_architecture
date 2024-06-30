

import 'package:equatable/equatable.dart';

import '../../../../core/enums/bloc_status_enum.dart';
import '../../domain/entities/auth_check_entity.dart';
import '../../domain/entities/my_tasks_entity.dart';

class MyTasksState extends Equatable {
  final BlocStatus status;
  final String errorMsg;
  final int totalPages;
  final MyTasksEntity? myTasksEntity;
  final AuthCheckEntity? authCheckEntity;
  final BlocStatus authCheckStatus;

  const MyTasksState({
    this.status = BlocStatus.initial,
    this.totalPages = 1,
    this.authCheckStatus = BlocStatus.initial,
    this.errorMsg = '',
    this.myTasksEntity,
    this.authCheckEntity,
  });

  @override
  List<Object?> get props => [
        authCheckStatus,
        authCheckEntity,
        myTasksEntity,
        errorMsg,
        status,
        totalPages,
      ];

  MyTasksState copyWith({
    BlocStatus? status,
    int? totalPages,
    String? errorMsg,
    MyTasksEntity? myTasksEntity,
    AuthCheckEntity? authCheckEntity,
    BlocStatus? authCheckStatus,
  }) {
    return MyTasksState(
      totalPages: totalPages ?? this.totalPages,
      authCheckEntity: authCheckEntity ?? this.authCheckEntity,
      authCheckStatus: authCheckStatus ?? this.authCheckStatus,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      myTasksEntity: myTasksEntity ?? this.myTasksEntity,
    );
  }
}

