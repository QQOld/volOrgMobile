import 'package:flutter/material.dart';
import 'package:vol_org/styles/styles.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: const Text("Заявки в волонтеры"),
          trailing: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: styles.baseColors.grey.withOpacity(0.7),
              shape: BoxShape.circle,),
            alignment: Alignment.center,
            child: Text("1", style: styles.mainTextTheme.labelLarge?.copyWith(color: Colors.white),),
          ),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          title: const Text("Заявки на поиск"),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          title: const Text("Операции"),
          trailing: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: styles.baseColors.grey.withOpacity(0.7),
              shape: BoxShape.circle,),
            alignment: Alignment.center,
            child: Text("23", style: styles.mainTextTheme.labelLarge?.copyWith(color: Colors.white),),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
