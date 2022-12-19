import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vol_org/styles/styles.dart';

import 'app_shell.dart';

void main() {

  Intl.systemLocale = Platform.localeName;
  runApp(const ProviderScope(child: VolOrgApp()));
}

class AppRouting {
  static void goToMain(BuildContext context) {
    context.go("/");
  }

}

class VolOrgApp extends StatefulWidget {
  const VolOrgApp({Key? key}) : super(key: key);

  @override
  State<VolOrgApp> createState() => _VolOrgAppState();
}

class _VolOrgAppState extends State<VolOrgApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Волонтёры33",
      debugShowCheckedModeBanner: false,
      theme: styles.mainTheme,
      routerConfig: GoRouter(routes: <RouteBase>[
        ShellRoute(
            builder: (context, state, child) {
              return AppShell(child: child);
            },
            routes: [
              GoRoute(
                  path: "/",
                  builder: (context, state) {
                    return Container();
                  }),
            ]),
      ]),
    );
  }
}
