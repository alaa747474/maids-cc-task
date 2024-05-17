import 'package:maids_cc_task/core/di/service_locator.dart';

import '../../features/todos/data/datasource/local/base_todos_local_data_sorce.dart';
import '../../features/todos/data/datasource/local/todos_local_data_sorce.dart';
import '../../features/todos/data/datasource/remote/base_todos_remote_data_sorce.dart';
import '../../features/todos/data/datasource/remote/todos_remote_data_sorce.dart';
import '../../features/todos/data/repositories/base_todos_repository.dart';
import '../../features/todos/data/repositories/todos_repository.dart';
import '../api/api_service.dart';

registerTodosDependencies() {
  //* DATA SOURCE
  sl.registerLazySingleton<BaseTodosRemoteDataSource>(
      () => TodosRemoteDataSource(sl<ApiService>()));
  sl.registerLazySingleton<BaseTodosLocalDataSource>(
      () => TodosLocalDataSource());
  //* REPOSITORY
  sl.registerLazySingleton<BaseTodosRepository>(
      () => TodosRepository(sl(),sl()));
}
