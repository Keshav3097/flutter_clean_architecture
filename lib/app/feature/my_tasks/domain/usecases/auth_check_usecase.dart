
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';


import '../../../../core/errors/failure.dart';
import '../entities/auth_check_entity.dart';
import '../repository/my_tasks_repository.dart';

class AuthCheckUseCase extends UseCase<Either<Failure, AuthCheckEntity>,void>{
  MyTasksRepository myTasksRepository;

  AuthCheckUseCase({ required this.myTasksRepository});
  @override
  Future<Either<Failure, AuthCheckEntity>> call({required void params}) async{
    var response=await myTasksRepository.authCheck();
    return response;
  }

}
