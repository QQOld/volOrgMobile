import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vol_org/domain/user.dart';
import 'package:vol_org/styles/styles.dart';

class AuthService {
  final FirebaseAuth fAuth = FirebaseAuth.instance;

  Future<AppUser?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if(user != null) return AppUser.fromFirebase(user);
    } catch(e) {
      log(e.toString());
    }
    return null;
  }

  Future<AppUser?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if(user != null) return AppUser.fromFirebase(user);
    } catch(e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }

  Future<void> logOut() async {
    await fAuth.signOut();
  }

  Stream<AppUser?> get currentUser{
    return fAuth.authStateChanges().map((User? user) => user != null ? AppUser.fromFirebase(user) : null);
  }
}