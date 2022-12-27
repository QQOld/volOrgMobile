import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vol_org/pages/admin_panel/admin_panel.dart';
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

class AppRouting {
  static const routeTabParam = "tab";

  static void goToMain(BuildContext context) {
    context.go("/");
  }

  static void goToAppTab(BuildContext context, TabType? tab) {
    final finalTab = tab ??
        ProviderScope.containerOf(context).read(chosenTabProvider) ??
        TabType.common;
    context.go("/${finalTab.name}");
  }
}

class VolOrgApp extends StatefulWidget {
  const VolOrgApp({Key? key}) : super(key: key);

  @override
  State<VolOrgApp> createState() => _VolOrgAppState();
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class _VolOrgAppState extends State<VolOrgApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Волонтёры33",
      debugShowCheckedModeBanner: false,
      theme: styles.mainTheme,
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const AppShell(),
      ),
    );
  }
}
