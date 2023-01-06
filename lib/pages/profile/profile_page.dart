import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/generated/proto/app_user.pb.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../services/auth.dart';
import '../../services/database_service.dart';
import '../../styles/styles.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surNameController = TextEditingController();

  AuthService authService = AuthService();
  DatabaseService dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
    final curUser = ref
        .read(currentUserProvider)
        .value ?? AppUser();
    emailController.text = curUser.email;
    nameController.text = curUser.name;
    surNameController.text = curUser.surName;
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    surNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curUser = ref
        .watch(currentUserProvider)
        .value ?? AppUser()
      ..freeze();

    return Container(
      decoration: styles.backgroundDecoration,
      child: Scaffold(
        appBar: AppBarBack(
          title: 'Профиль',
          context: context,
          onBack: () {
            final nav = Navigator.of(context);
            if (nav.canPop()) nav.pop();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        labelText: "Email", hintText: "myemail@mail.ru"),
                    onChanged: (str) {
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        labelText: "Имя", hintText: "Имя"),
                    onChanged: (str) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: surNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "Фамилия", hintText: "Фамилия"),
                    onChanged: (str) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (nameController.text != curUser.name ||
                      surNameController.text != curUser.surName ||
                      emailController.text != curUser.email)
                    ElevatedButton(
                      onPressed: () async {
                        dbService.addOrUpdateUser(AppUser(id: curUser.id,
                          name: nameController.text,
                          surName: surNameController.text,
                          email: emailController.text,),
                        );
                        if(emailController.text != curUser.email) {

                        }
                      },
                      child: Text(
                        "Сохранить",
                        style: styles.mainTextTheme.bodyLarge
                            ?.copyWith(letterSpacing: 0.5),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: styles.themeColors.danger),
                    onPressed: () async {
                      await authService.logOut();
                    },
                    child: Text(
                      "Выйти",
                      style: styles.mainTextTheme.bodyLarge
                          ?.copyWith(letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
