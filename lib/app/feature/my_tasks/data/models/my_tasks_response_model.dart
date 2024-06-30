

// To parse this JSON data, do
//
//     final myTasksResponseModel = myTasksResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/my_tasks_entity.dart';

MyTasksResponseModel myTasksResponseModelFromJson(String str) =>
    MyTasksResponseModel.fromJson(
      json.decode(str),
    );

String myTasksResponseModelToJson(MyTasksResponseModel data) => json.encode(
      data.toJson(),
    );

class MyTasksResponseModel {
  int status;
  String message;
  Data data;

  MyTasksResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MyTasksResponseModel.fromJson(Map<String, dynamic> json) =>
      MyTasksResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
  MyTasksEntity toEntity() {
    return MyTasksEntity(
        queries: data.queries, queriesCount: data.queriesCount,);
  }
}

class Data {
  List<QueriesCount> queriesCount;
  List<Query> queries;

  Data({
    required this.queriesCount,
    required this.queries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        queriesCount: List<QueriesCount>.from(
          json["queries_count"].map(
            (x) => QueriesCount.fromJson(x),
          ),
        ),
        queries: List<Query>.from(
          json["queries"].map(
            (x) => Query.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "queries_count": List<dynamic>.from(
          queriesCount.map(
            (x) => x.toJson(),
          ),
        ),
        "queries": List<dynamic>.from(
          queries.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Query {
  String id;
  String subject;
  String status;
  String raisedBy;
  String raisedOn;
  String assignedTo;

  Query({
    required this.id,
    required this.subject,
    required this.status,
    required this.raisedBy,
    required this.raisedOn,
    required this.assignedTo,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        id: json["id"],
        subject: json["subject"],
        status: json["status"],
        raisedBy: json["raised_by"],
        raisedOn: json["raised_on"],
        assignedTo: json["assigned_to"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "status": status,
        "raised_by": raisedBy,
        "raised_on": raisedOn,
        "assigned_to": assignedTo,
      };
}

class QueriesCount {
  String id;
  String displayText;
  String value;

  QueriesCount({
    required this.id,
    required this.displayText,
    required this.value,
  });

  factory QueriesCount.fromJson(Map<String, dynamic> json) => QueriesCount(
        id: json["id"],
        displayText: json["display_text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "display_text": displayText,
        "value": value,
      };
}