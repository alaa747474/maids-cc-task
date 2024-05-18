import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:maids_cc_task/core/config/router/app_routes.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/api_end_points.dart';
import '../../models/user.dart';
import '../../params/login_params.dart';
import 'base_auth_remote_data_source.dart';

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSource(this._apiService);

  @override
  Future<User> login(LoginParams params) async {
    Response response =  await _apiService.post(endPoint: ApiEndPoints.login,data: params.toJson());
    User user=User.fromJson(response.data);
    log("user $user");
    return User.fromJson(response.data);
  }
}
