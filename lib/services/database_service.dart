import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vol_org/generated/proto/app_user.pb.dart';

class DatabaseService {
  final users =
      FirebaseFirestore.instance.collection("users").withConverter<AppUser>(
            fromFirestore: (snapshot, _) => AppUser.create()..mergeFromProto3Json(snapshot.data()),
            toFirestore: (AppUser user, _) => jsonDecode(jsonEncode(user.toProto3Json())),
          );

  Future<AppUser?> getUser(String id) async {
    final userRef = users.doc(id);
    final docSnap = await userRef.get();
    final user = docSnap.data();
    return user;
  }

  Future<AppUser> addOrUpdateUser(AppUser user) async {
    DocumentReference userRef = users.doc(user.id);
    await userRef.set(user);
    return user;
  }
}