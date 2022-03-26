import 'package:flutter/material.dart';

class UserModel{
  String id;
  String firstName;
  String lastName;
  String email;
  String userName;
  List<String>? roles;

  UserModel({
    this.id = "",
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.userName = "",
    this.roles
  });

  UserModel.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    firstName = json["firstName"],
    lastName = json["lastName"],
    email = json["email"],
    userName = json["userName"],
    roles = List<String>.from(json["roles"].map((x) => x.toString()));

  Map<String, dynamic> toJson() => {
    "id" : id,
    "firstName" : firstName,
    "lastName" : lastName,
    "email" : email,
    "userName" : userName,
    "roles" : roles
  };
}