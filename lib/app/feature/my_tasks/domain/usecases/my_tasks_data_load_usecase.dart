
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/my_tasks_request_model.dart';


import '../../../../core/errors/failure.dart';
import '../../../../core/model/use_case_request_model.dart';
import '../entities/my_tasks_entity.dart';
import '../repository/my_tasks_repository.dart';


class MyTasksDataLoadUSeCase extends UseCase<Either<Failure, MyTasksEntity>,
    UseCaseRequestModel<MyTasksRequestModel>> {
  MyTasksRepository myTasksRepository;
  MyTasksDataLoadUSeCase({required this.myTasksRepository});

  @override
  Future<Either<Failure, MyTasksEntity>> call({
    required UseCaseRequestModel<MyTasksRequestModel> params,
  }) {
    var response = myTasksRepository.myTasksDataLoaded(
      useCaseRequestModel: params,
    );
    return response;
  }
}