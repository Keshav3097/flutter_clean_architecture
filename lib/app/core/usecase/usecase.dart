abstract class UseCase<Type,Params>{
  Future<Type> call({ required Params params});
}

abstract class BaseUseCase<Type,Params>{
  Type call({ required Params params});
}