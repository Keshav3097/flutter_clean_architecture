import 'dart:convert';

import '../../domain/entities/auth_check_entity.dart';

// To parse this JSON data, do
//
//     final authResponseModel = authResponseModelFromJson(jsonString);

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(
      json.decode(str),
    );

String authResponseModelToJson(AuthResponseModel data) => json.encode(
      data.toJson(),
    );

class AuthResponseModel {
  int status;
  String message;
  Data data;

  AuthResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
  AuthCheckEntity toEntity() {
    return AuthCheckEntity(
      message: data.message,
      employeeId: data.profile.employeeId,
      email: data.profile.email,
      firstName: data.profile.firstName,
      hasAccess: data.hasAccess,
      profileImage: data.profile.profileImage,
    );
  }
}

class Data {
  bool hasAccess;
  String message;
  Profile profile;

  Data({
    required this.hasAccess,
    required this.message,
    required this.profile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hasAccess: json["hasAccess"],
        message: json["message"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "hasAccess": hasAccess,
        "message": message,
        "profile": profile.toJson(),
      };
}

class Profile {
  int employeeId;
  String firstName;
  String email;
  String profileImage;

  Profile({
    required this.employeeId,
    required this.firstName,
    required this.email,
    required this.profileImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        employeeId: json["employeeId"],
        firstName: json["firstName"],
        email: json["email"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "firstName": firstName,
        "email": email,
        "profileImage": profileImage,
      };
}
