part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginSuccessState extends AuthState {
  final User user;
  const LoginSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

final class LoginFailuresState extends AuthState {
  final String error;
  @override
  List<Object> get props => [error];
  const LoginFailuresState({required this.error});
}
