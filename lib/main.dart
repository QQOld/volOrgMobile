import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/styles/styles.dart';

import 'app_shell.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Intl.systemLocale = Platform.localeName;
  runApp(const ProviderScope(child: VolOrgApp()));
}

class VolOrgApp extends ConsumerStatefulWidget {
  const VolOrgApp({Key? key}) : super(key: key);

  @override
  ConsumerState<VolOrgApp> createState() => _VolOrgAppState();
}

class _VolOrgAppState extends ConsumerState<VolOrgApp> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return MaterialApp(
      title: "Волонтёры33",
      debugShowCheckedModeBanner: false,
      theme: styles.mainTheme,
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: auth.when(
            data: (user) => const AppShell(),
            error: (e, s) {
              log("unable to get auth $e", error: e, stackTrace: s);
              return Container();
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
