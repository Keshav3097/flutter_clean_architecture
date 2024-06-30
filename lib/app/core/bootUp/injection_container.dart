
import 'package:get_it/get_it.dart';

import '../../feature/my_tasks/data/data_source/my_tasks_data_source.dart';
import '../../feature/my_tasks/data/repository/my_task_repository_impl.dart';
import '../../feature/my_tasks/domain/repository/my_tasks_repository.dart';
import '../../feature/my_tasks/domain/usecases/my_tasks_data_load_usecase.dart';
import '../../feature/my_tasks/presentation/bloc/my_tasks_bloc.dart';
import 'package:http/http.dart' as http;

import '../http_helper/http_client.dart';




final serviceLocator = GetIt.instance;

void setUpLocator() {
  ///Bloc
  serviceLocator.registerFactory(
    () => MyTasksBloc(
      myTasksDataLoadUSeCase: serviceLocator(),
      authCheckUseCase: serviceLocator(),
    ),
  );
  // serviceLocator.registerFactory(
  //   () => TaskDetailsBloc(
  //     getTasksDetailsUseCase: serviceLocator(),
  //     downloadAttachmentUseCase: serviceLocator(),
  //     queryResolveUseCase: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory(
  //   () => ProfileBloc(
  //     logoutUseCase: serviceLocator(),
  //   ),
  // );

  ///UseCase
  serviceLocator.registerLazySingleton(
    () => MyTasksDataLoadUSeCase(
      myTasksRepository: serviceLocator(),
    ),
  );
  // serviceLocator.registerLazySingleton(
  //   () => AuthCheckUseCase(
  //     myTasksRepository: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton(
  //   () => GetTasksDetailsUseCase(
  //     tasksDetailsRepository: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton(
  //   () => DownloadAttachmentUseCase(
  //     tasksDetailsRepository: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton(
  //   () => QueryResolveUseCase(
  //     tasksDetailsRepository: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton(
  //   () => LogoutUseCase(
  //     profileRepository: serviceLocator(),
  //   ),
  // );

  ///Repository
  serviceLocator.registerLazySingleton<MyTasksRepository>(
    () => MyTasksRepositoryImpl(
      myTasksDataSource: serviceLocator(),
    ),
  );
  // serviceLocator.registerLazySingleton<TasksDetailsRepository>(
  //   () => TaskDetailsRepositoryImpl(
  //     taskDetailsDataSource: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton<ProfileRepository>(
  //   () => ProfileRepositoryImpl(
  //     profileDataSource: serviceLocator(),
  //   ),
  // );

  ///DataSource
  serviceLocator.registerLazySingleton<MyTasksDataSource>(
    () => MyTasksDataSourceImpl(
      httpClientManager: serviceLocator(),
    ),
  );
  // serviceLocator.registerLazySingleton<TaskDetailsDataSource>(
  //   () => TaskDetailDataSourceImpl(
  //     httpClientManager: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton<ProfileDataSource>(
  //   () => ProfileDataSourceImpl(
  //     httpClientManager: serviceLocator(),
  //   ),
  // );

  /// external Setup
  serviceLocator.registerLazySingleton(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => HttpClientManager(),
  );
}