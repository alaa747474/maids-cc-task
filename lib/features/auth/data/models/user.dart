import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String  token ;

  const User(
      {
      required this.token,

      required this.id});
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
   
        token: json['token'],

      );

  @override
  List<Object?> get props =>
      [id, token,];
}
