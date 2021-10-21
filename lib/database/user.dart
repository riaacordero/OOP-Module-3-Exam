import 'package:flutter/material.dart';

class User {
  String name;
  Image profilePicture;

  User(this.name, String profilePicturePath) 
    : profilePicture = Image.asset(profilePicturePath);
}

List<User> users = [
  User("riaacordero", "assets/img/profile_pictures/ria.jpg"),
  User("renshi", "assets/img/profile_pictures/neil.jpg"),
  User("grmpnls_", "assets/img/profile_pictures/gerome.jpg"),
  User("dyemsmoreno", "assets/img/profile_pictures/rendell.jpg"),
  User("hrjugar", "assets/img/profile_pictures/hernan.jpg")
];

User currentUser = users[0];