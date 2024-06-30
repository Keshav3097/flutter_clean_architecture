  import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/http_helper/models/request_model.dart';
import '../../../../core/model/use_case_request_model.dart';
import '../data_source/my_tasks_data_source.dart';
import '../../domain/entities/my_tasks_entity.dart';
import '../../domain/entities/auth_check_entity.dart';
import '../../domain/repository/my_tasks_repository.dart';
import '../models/my_tasks_request_model.dart';

class MyTasksRepositoryImpl extends MyTasksRepository {
  MyTasksDataSource myTasksDataSource;

  MyTasksRepositoryImpl({required this.myTasksDataSource});

  @override
  Future<Either<Failure, MyTasksEntity>> myTasksDataLoaded({
    required UseCaseRequestModel<MyTasksRequestModel> useCaseRequestModel,
  }) async {
    try {
      var response = await myTasksDataSource.postMyTasks(
        useCaseRequestModel: useCaseRequestModel,
      );
      if (response.status == RequestStatus.SUCCESS) {
        return Right(
          response.body!.toEntity(),
        );
      } else {
        return Left(
          Error(response.body?.message ?? response.message!),
        );
      }
    } on ServerException {
      return const Left(
        ServerFailure('An error has occurred'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthCheckEntity>> authCheck() async {
    try {
      var response = await myTasksDataSource.authCheck();
      if (response.status == RequestStatus.SUCCESS) {
        return Right(
          response.body!.toEntity(),
        );
      } else {
        return Left(
          Error(response.message ?? 'Try Again Later'),
        );
      }
    } on ServerException {
      return const Left(
        ServerFailure('An error has occurred'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }
}