import 'package:equatable/equatable.dart';

class AuthCheckEntity extends Equatable {
  final bool? hasAccess;
  final int? employeeId;
  final String? message;
  final String? firstName;
  final String? email;
  final String? profileImage;
  const AuthCheckEntity(
      {required this.employeeId,
      required this.email,
      required this.firstName,
      required this.hasAccess,
      required this.profileImage,
      required this.message,});

  @override
  List<Object?> get props =>
      [hasAccess, email, employeeId, profileImage, firstName, message];
}

