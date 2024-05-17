import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String? email;
  final String? username;
  final String? password;

  const LoginParams({
    this.email,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) data['email'] = email;
    if (username != null) data['username'] = username;
    if (password != null) data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [
        email,
        username,
        password,
      ];
}
