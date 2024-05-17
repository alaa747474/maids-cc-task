

import '../../features/auth/data/datasource/remote/auth_remote_data_source.dart';
import '../../features/auth/data/datasource/remote/base_auth_remote_data_source.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/data/repository/base_auth_repository.dart';
import '../api/api_service.dart';
import 'service_locator.dart';

void registerAuthDependencies() {
  //* DATA SOURCE
  sl.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl<ApiService>()));
  //* REPOSITORY
  sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(sl<BaseAuthRemoteDataSource>()));
}
