import 'package:flutter/material.dart';
import 'package:vol_org/pages/credentials/authorization_page.dart';
import 'package:vol_org/pages/credentials/registr_page.dart';
import 'package:vol_org/services/auth.dart';
import 'package:vol_org/widgets/ElevatedButtonRightIcon.dart';

import '../../styles/styles.dart';

class CommonContent extends StatelessWidget {
  const CommonContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButtonRightIcon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const RegistrationPage();
                  },
                ),
              );
            },
            label: Text(
              "Подать заявку на поиск",
              style: styles.mainTextTheme.titleSmall,
            ),
            icon: const Icon(Icons.arrow_forward_ios)),
        const SizedBox(
          height: 15,
        ),
        ElevatedButtonRightIcon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const AuthPage();
                  },
                ),
              );
            },
            label: Text("Стать волонтёром",
                style: styles.mainTextTheme.titleSmall),
            icon: const Icon(Icons.arrow_forward_ios)),
        const SizedBox(
          height: 15,
        ),
        ElevatedButtonRightIcon(
            onPressed: () {
              authService.logOut();
            },
            label: Text("Подать заявку на поиск",
                style: styles.mainTextTheme.titleSmall),
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
