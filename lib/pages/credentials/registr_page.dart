import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vol_org/domain/user.dart';
import 'package:vol_org/pages/credentials/authorization_page.dart';
import 'package:vol_org/services/auth.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
            title: "Регистрация",
            onBack: () {
              final nav = Navigator.of(context);
              if (nav.canPop()) nav.pop();
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            labelText: "Email", hintText: "myemail@mail.ru"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (str) {
                          if (str != null && !EmailValidator.validate(str)) {
                            return "Некорректный email";
                          }
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (str) {
                          if (str != null && str.length < 8) {
                            return "Минимум 8 символов";
                          }
                          return null;
                        },
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
                              AppUser? user =
                              await authService.registerWithEmailAndPassword(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                              if (user == null) {
                                Fluttertoast.showToast(
                                  msg: "Ошибка регистрации",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: styles.themeColors.danger,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Успешная регистрация",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: styles.themeColors.success,
                                );
                                formKey.currentState?.reset();
                                nav.pushReplacement(MaterialPageRoute(builder: (context) => const AuthPage()));
                              }
                            } catch(e) {
                              log(e.toString());
                            }
                          }
                        },
                        child: Text(
                          "Зарегестрироваться",
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
                              builder: (context) => const AuthPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Войти",
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
      ),
    );
  }
}
