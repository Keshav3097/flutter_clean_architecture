
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qms_admin/app/core/enums/bloc_status_enum.dart';
import '../../../../core/responsive/responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widget/common widget.dart';
import '../../../../core/shared_widget/scaffold_wrapper.dart';
import '../bloc/my_tasks_bloc.dart';
import '../bloc/my_tasks_state.dart';
import '../widgets/build_my_tasks_widget.dart';
import '../../../../core/bootUp/injection_container.dart';
import '../../../../core/user_preferences/user_preferences.dart';
import '../bloc/my_tasks_event.dart';

@RoutePage()
class MyTasksPage extends StatefulWidget {
  const MyTasksPage({super.key});

  @override
  State<MyTasksPage> createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  late MyTasksBloc myTasksBloc;
  int pageNumber = 1;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    myTasksBloc = MyTasksBloc(
      myTasksDataLoadUSeCase: serviceLocator(),
      authCheckUseCase: serviceLocator(),
    );
    _scrollController.addListener(() {
      _scrollListener();
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (pageNumber < totalPages) {
        // keyItemsDetailsBloc!.loadLoader(true);
        pageNumber++;
        myTasksBloc.add(
          LoadMyTasksEvent(pageNumber: '$pageNumber'),
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    myTasksBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('object $totalPages');
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocConsumer<MyTasksBloc, MyTasksState>(
          listener: (context, state) {
            // if(state.status.isSuccess){
              totalPages=state.totalPages;
            // }
            if (state.authCheckStatus.isSuccess &&
                state.authCheckEntity!.hasAccess!) {
              UserPreferences.setUserName(state.authCheckEntity!.firstName!);
              UserPreferences.setUserEmail(state.authCheckEntity!.email!);
              UserPreferences.setEmployeeCode(
                state.authCheckEntity!.employeeId!,
              );
              UserPreferences.setUserPhoto(
                state.authCheckEntity!.profileImage!,
              );
            }
          },
          builder: (context, state) {
            debugPrint('${state.authCheckStatus}');
            if (state.authCheckStatus.isLoading) {
              return loaderWidget();
            } else if (state.authCheckStatus.isError) {
              return loginErrorWidget(errorMsg: state.errorMsg);
            } else if (state.authCheckStatus.isSuccess) {
              return BlocProvider(
                  create: (context) {
                    return myTasksBloc..add(
                        LoadMyTasksEvent(pageNumber: '1'),);
                  },
                  child: ScaffoldWrapper(
                    body: BlocBuilder<MyTasksBloc, MyTasksState>(
                      builder: (context, state) {
                        if (state.status.isLoading) {
                          return loaderWidget();
                        } else if (state.status.isError) {
                          return errorWidget(errorMsg: state.errorMsg);
                        } else if (state.status.isSuccess) {
                          totalPages = state.totalPages;
                          return buildMyTaskWidget(totalPages: totalPages,
                            context: context,
                            myTasksEntity: state.myTasksEntity!,
                            pageNumber: pageNumber,
                            scrollController: _scrollController,);
                        }
                        return const SizedBox();
                      },
                    ),
                  ),


              );
            }
            return const SizedBox();
          },
        );
      },
      context: context,
    );
  }
}