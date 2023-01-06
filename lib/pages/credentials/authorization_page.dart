import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vol_org/pages/credentials/registr_page.dart';
import 'package:vol_org/services/auth.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../components/show_toast.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: styles.backgroundDecoration,
        child: Scaffold(
          appBar: AppBarBack(
            title: "Авторизация",
            onBack: () {
              final nav = Navigator.of(context);
              if (nav.canPop()) nav.pop();
            },
            context: context,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          labelText: "Email", hintText: "myemail@mail.ru"),
                      onChanged: (str) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Пароль", hintText: "mypassword"),
                      onChanged: (str) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: styles.maxElevatedButtonStyle,
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? true) {
                          try {
                            final nav = Navigator.of(context);
                            User? user =
                                await authService.signInWithEmailAndPassword(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                            if (user == null) {
                              showFailureMessage("Ошибка логина");
                            } else {
                              formKey.currentState?.reset();
                              nav.pop();
                            }
                          } catch (e) {
                            log(e.toString());
                          }
                        }
                      },
                      child: Text(
                        "Войти",
                        style: styles.mainTextTheme.bodyLarge
                            ?.copyWith(letterSpacing: 0.5),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegistrationPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Регистрация",
                        style: styles.mainTextTheme.labelLarge?.copyWith(
                            color: styles.themeColors.brand,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
