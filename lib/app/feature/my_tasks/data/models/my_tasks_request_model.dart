


// To parse this JSON data, do
//
//     final myTasksRequestModel = myTasksRequestModelFromJson(jsonString);

import 'dart:convert';

MyTasksRequestModel myTasksRequestModelFromJson(String str) =>
    MyTasksRequestModel.fromJson(
      json.decode(str),
    );

String myTasksRequestModelToJson(MyTasksRequestModel data) => json.encode(
      data.toJson(),
    );

class MyTasksRequestModel {
  String resolverId;

  MyTasksRequestModel({
    required this.resolverId,
  });

  factory MyTasksRequestModel.fromJson(Map<String, dynamic> json) =>
      MyTasksRequestModel(
        resolverId: json["resolver_id"],
      );

  Map<String, dynamic> toJson() => {
        "resolver_id": resolverId,
      };
}
