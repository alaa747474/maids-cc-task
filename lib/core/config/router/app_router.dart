import 'package:flutter/material.dart';
import 'package:maids_cc_task/core/config/router/app_routes.dart';
import 'package:maids_cc_task/features/todos/presentation/screens/todos_screen.dart';

import '../../../features/auth/presentation/screens/login_screen.dart';


class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return _createRoute(const LoginScreen());
      case AppRoutes.todos:
        return _createRoute(const TodosScreen());

      default:
        return _createRoute(const LoginScreen());
    }
  }

  PageRoute _createRoute(Widget screen) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
