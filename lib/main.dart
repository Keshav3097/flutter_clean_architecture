import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/config/routes/auto_router.dart';
import 'app/core/utils/colors.dart';
//import 'app/feature/tasks_details/presentation/bloc/task_details_bloc.dart';
import 'app/core/bootUp/injection_container.dart';
import 'app/feature/my_tasks/presentation/bloc/my_tasks_bloc.dart';
import 'app/feature/my_tasks/presentation/bloc/my_tasks_event.dart';
// import 'app/feature/profile/presentation/bloc/profile_bloc.dart';
// import 'app/feature/profile/presentation/bloc/profile_event.dart';

class MyApp extends StatelessWidget {
   MyApp({
    super.key,
  });
   final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MyTasksBloc(
            myTasksDataLoadUSeCase: serviceLocator(),
            authCheckUseCase: serviceLocator(),
          )..add(AuthCheckEvent()),
        ),
        // BlocProvider(
        //   create: (BuildContext context) => TaskDetailsBloc(
        //     getTasksDetailsUseCase: serviceLocator(),
        //     downloadAttachmentUseCase: serviceLocator(),
        //     queryResolveUseCase: serviceLocator(),
        //   ),
        // ),
        // BlocProvider(
        //   create: (context) => ProfileBloc(logoutUseCase: serviceLocator())
        //     ..add(LoadProfileDataEvent()),
        // ),
      ],
      child: MaterialApp.router(
        title: 'QMS',
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: CustomColors.whiteColor,
        ),
        // theme: AppTheme.lightTheme(context),
        // darkTheme: AppTheme.darkTheme(context),
        // themeMode: ThemeMode.light,
        routerConfig: _appRouter.config(),
        // home: const  TasksDetailsPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}