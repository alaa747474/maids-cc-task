import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/custom_dialog.dart';
import '../../data/repository/base_auth_repository.dart';
import '../bloc/auth_bloc.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(sl<BaseAuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {}
            if (state is LoginFailuresState) {
             
              showCustomDialog(
                context,
                child:Text(state.error)
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: context.read<AuthBloc>().usernameController,
                ),
                TextField(
                  controller: context.read<AuthBloc>().passwordController,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(Login());
                    },
                    child: const Text(
                      "Login",
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
