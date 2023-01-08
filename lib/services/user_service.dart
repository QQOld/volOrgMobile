import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../generated/app_user.pb.dart';
import '../generated/vol_request.pb.dart';

class UserService {
  final users =
      FirebaseFirestore.instance.collection("users").withConverter<AppUser>(
            fromFirestore: (snapshot, _) =>
                AppUser.create()..mergeFromProto3Json(snapshot.data()),
            toFirestore: (AppUser user, _) =>
                jsonDecode(jsonEncode(user.toProto3Json())),
          );

  Future<AppUser?> getUser(String id) async {
    final userRef = users.doc(id);
    final docSnap = await userRef.get();
    final user = docSnap.data();
    return user;
  }

  Stream<QuerySnapshot<AppUser>> get getAllUsers => users.snapshots();

  Future<AppUser> addOrUpdateUser(AppUser user) async {
    DocumentReference userRef = users.doc(user.id.isEmpty ? null : user.id);
    await userRef.set(user);
    return user;
  }

  Future<bool> addOrUpdateVolReq(AppUser user, VolRequest volReq) async {
    DocumentReference userRef = users.doc(user.id.isEmpty ? null : user.id);
    try {
      await userRef.update({'volRequest': volReq.toProto3Json()});
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
