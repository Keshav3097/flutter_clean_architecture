

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/model/use_case_request_model.dart';
import '../entities/my_tasks_entity.dart';


import '../../data/models/my_tasks_request_model.dart';
import '../entities/auth_check_entity.dart';

abstract class MyTasksRepository {
  Future<Either<Failure, MyTasksEntity>> myTasksDataLoaded({
    required UseCaseRequestModel<MyTasksRequestModel> useCaseRequestModel,
  });
  Future<Either<Failure, AuthCheckEntity>> authCheck();
}
