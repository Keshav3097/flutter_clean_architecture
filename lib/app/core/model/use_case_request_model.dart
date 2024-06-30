class UseCaseRequestModel<Type> {
  Map<String,String>? query;
  Type? body;
  UseCaseRequestModel({
    this.query,
    this.body,
  });

}
