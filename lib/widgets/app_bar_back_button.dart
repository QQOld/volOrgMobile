import 'package:flutter/material.dart';
import 'package:vol_org/pages/profile/profile_page.dart';

class AppBarBack extends AppBar {
  AppBarBack({
    Key? key,
    required String title,
    void Function()? onBack,
    Color? backgroundColor,
    required BuildContext context,
  }) : super(
          key: key,
          title: Text(title),
          leading: onBack != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                )
              : null,
          actions: [
            IconButton(
              icon: const Icon(Icons.person_rounded),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
          ],
          backgroundColor: backgroundColor,
        );
}
