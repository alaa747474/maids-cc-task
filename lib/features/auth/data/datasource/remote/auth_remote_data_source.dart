import 'package:dio/dio.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/api_end_points.dart';
import '../../models/user.dart';
import '../../params/login_params.dart';
import 'base_auth_remote_data_source.dart';

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSource(this._apiService);
  Future<dynamic> _postRequest({required String endPoint, dynamic data}) async {
    Response response = await _apiService.post(
      data: data,
      endPoint: endPoint,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<User> login(LoginParams params) async {
    final json =
        await _postRequest(endPoint: ApiEndPoints.login, data: params.toJson());
    return User.fromJson(json);
  }
}
