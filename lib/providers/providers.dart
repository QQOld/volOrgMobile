import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/services/database_service.dart';

import '../app_shell.dart';
import '../generated/proto/app_user.pb.dart';

final tabListProvider =
    Provider.family.autoDispose<List<TabType>, AppUser?>((ref, user) => [
          TabType.common,
          if (user != null) TabType.messages,
          TabType.operations,
          if (user != null) TabType.admin,
        ]);

final authProvider = StreamProvider.autoDispose<User?>((ref) {
  final streamController = StreamController<User?>();
  String? lastId;
  final sub = FirebaseAuth.instance.userChanges().listen((user) {
    if (!streamController.isClosed) {
      final nid = user?.uid ?? "";
      if (lastId != nid) {
        log("Authenticated user ${user?.uid}");
        if (!streamController.isClosed) {
          streamController.add(user);
        }
      }
      lastId = nid;
    }
  });
  ref.onDispose(() {
    streamController.close();
    sub.cancel();
  });
  return streamController.stream;
});

final currentUserProvider = FutureProvider.autoDispose<AppUser>((ref) async {
  final db = DatabaseService();
  final curUser = ref.watch(authProvider).value;
  if(curUser != null) {
    final user = await db.getUser(curUser.uid) ?? AppUser();
    return user..freeze();
  }
  return AppUser()..freeze();
});
