import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vol_org/generated/proto/app_user.pb.dart';
import 'package:vol_org/styles/styles.dart';

import 'database_service.dart';

class AuthService {
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final DatabaseService db = DatabaseService();

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch(e) {
      log(e.toString());
    }
    return null;
  }

  Future<AppUser?> registerWithEmailAndPassword(AppUser appUser) async {
    try {
      UserCredential result = await fAuth.createUserWithEmailAndPassword(email: appUser.email, password: appUser.password);
      User? user = result.user;
      if(user != null) {
        final newUser = AppUser(
          id: user.uid,
          name: appUser.name,
          surName: appUser.surName,
          email: user.email
        );
        await db.addOrUpdateUser(newUser);
        return newUser;
      }
    } catch(e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }

  Future<void> logOut() async {
    await fAuth.signOut();
  }

  /*Stream<AppUser?> get currentUser{
    return fAuth.authStateChanges().map((User? user) => user != null ? AppUser.fromFirebase(user) : null);
  }*/
}