import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:maids_cc_task/core/cache/app_secure_storage.dart';
import 'package:maids_cc_task/core/config/router/app_router.dart';
import 'package:maids_cc_task/core/config/router/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maids_cc_task/core/config/theme/app_theme.dart';
import 'core/config/app_bloc_observer.dart';
import 'core/di/service_locator.dart';
import 'features/todos/data/models/todo.dart';

late String? token;
void main() async {
  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  token = await AppSecureStorage.instance.getToken();
  Future.wait([setUpServiceLocator(), Hive.initFlutter()]);
  Hive.registerAdapter(TodoAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maids.cc Task',
        theme: AppTheme.theme(),
        initialRoute:AppRoutes.login,
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
