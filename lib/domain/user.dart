import 'package:firebase_auth/firebase_auth.dart';

class AppUser{
  String id = "";
  String name = "";
  String surName = "";
  String password = "";

  AppUser.fromFirebase(User user) {
    id = user.uid;
  }
}