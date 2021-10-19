import 'package:flutter/material.dart';

class User {
  String username;
  Image profilePicture;

  User(this.username, String profilePicturePath) 
    : profilePicture = Image.asset(profilePicturePath);
}

List<User> users = [
  User("riaacordero", "assets/img/users/ria.jpg"),
  User("renshi", "assts/img/users/neil.jpg"),
  User("grmpnls_", "assets/img/users/gerome.jpg"),
  User("dyemsmoreno", "assets/img/users/rendell.jpg"),
  User("hrjugar", "assets/img/users/hernan.jpg")
];

User currentUser = users[0];