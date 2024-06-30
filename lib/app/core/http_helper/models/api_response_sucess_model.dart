import 'dart:convert';

ApiResponseSuccessModel apiResponseSuccessModelFromJson(String str) => ApiResponseSuccessModel.fromJson(json.decode(str));

String apiResponseSuccessModelToJson(ApiResponseSuccessModel data) => json.encode(data.toJson());

class ApiResponseSuccessModel {
  int status;
  String message;
  dynamic data;

  ApiResponseSuccessModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponseSuccessModel.fromJson(Map<String, dynamic> json) => ApiResponseSuccessModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
