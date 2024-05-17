import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/app_secure_storage.dart';
import '../../data/models/user.dart';
import '../../data/params/login_params.dart';
import '../../data/repository/base_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<Login>(_login);
  }
  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }

  final BaseAuthRepository _authRepository;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _login(Login event, Emitter<AuthState> emit) async {
    final result = await _authRepository.login(
      LoginParams(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    result.fold((failure) => emit(LoginFailuresState(error: failure.error)),
        (user) {
      AppSecureStorage.instance
          .storeToken(user.token)
          .then((value) => emit(LoginSuccessState(user: user)));
    });
  }
}
