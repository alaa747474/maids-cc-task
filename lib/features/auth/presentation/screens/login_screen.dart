import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maids_cc_task/core/components/custom_button.dart';
import 'package:maids_cc_task/core/components/custom_text_field.dart';
import 'package:maids_cc_task/core/config/router/app_routes.dart';

import '../../../../core/components/loading_indicator.dart';
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
        
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.todos, (route) => false);
            }
            if (state is LoginFailuresState) {
              showCustomDialog(context, child: Text(state.error));
            }
          },
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login,color: Theme.of(context).primaryColor,size: 240.r,),
                  CustomTextField(
                    controller: context.read<AuthBloc>().usernameController, hintText: 'Username',
                  ),
                  SizedBox(height: 8.h,),
                  CustomTextField(
                    hintText: 'Password',
                    controller: context.read<AuthBloc>().passwordController,
                  ),
                  SizedBox(height: 32.h,),
                  CustomButton(
                    onTap: () {
                      context.read<AuthBloc>().add(Login());
                    },
                    isLoading: state is AuthLoading,
                    actionTitle: "Login",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
