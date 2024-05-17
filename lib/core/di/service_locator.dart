
import 'package:get_it/get_it.dart';
import 'package:maids_cc_task/core/di/todos_dependencies.dart';

import '../api/api_service.dart';
import 'auth_dependencies.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //* Register the API service as a singleton.
  sl.registerSingleton(ApiService());

  //* Register the dependencies related to authentication.
  registerAuthDependencies();
  registerTodosDependencies();
}


