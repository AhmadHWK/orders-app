part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class UploadProfilePic extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {
  final String message;
  final UserModel userModel;

  SignInSuccess({required this.userModel, required this.message});
}

final class SignInFailure extends AuthState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends AuthState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class LogOutSuccess extends AuthState {
  final String message;

  LogOutSuccess({required this.message});
}

final class LogOutLoading extends AuthState {}

final class LogOutFailure extends AuthState {
  final String errMessage;

  LogOutFailure({required this.errMessage});
}
