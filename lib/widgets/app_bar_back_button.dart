import 'package:flutter/material.dart';

class AppBarBack extends AppBar {
  AppBarBack({Key? key, required String title, void Function()? onBack, Color? backgroundColor,})
      : super(
          key: key,
          title: Text(title),
          leading: onBack != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                )
              : null,
    backgroundColor: backgroundColor
        );
}
