import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username, token, email, firstName, lastName, image, gender;

  const User(
      {required this.username,
      required this.token,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.image,
      required this.gender,
      required this.id});
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        token: json['token'],
        email: json['email'],
        firstName: json['firsName'],
        lastName: json['lastName'],
        image: json['image'],
        gender: json['gender'],
      );

  @override
  List<Object?> get props =>
      [id, username, token, email, firstName, lastName, image, gender];
}
