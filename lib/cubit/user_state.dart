import 'package:masterapi/model/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class Signinsuccess extends UserState {}

final class Signinloading extends UserState {}

final class Signinfailure extends UserState {
  final String error;

  Signinfailure({required this.error});
}
final class UploadProfilePic extends UserState {}
final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}