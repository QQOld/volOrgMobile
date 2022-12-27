import 'package:flutter/material.dart';
import 'package:vol_org/widgets/ElevatedButtonRightIcon.dart';

import '../../styles/styles.dart';

class CommonContent extends StatelessWidget {
  const CommonContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButtonRightIcon(
            onPressed: () {},
            label: Text("Подать заявку на поиск", style: styles.mainTextTheme.titleSmall,),
            icon: const Icon(Icons.arrow_forward_ios)),
        const SizedBox(
          height: 15,
        ),
        ElevatedButtonRightIcon(
            onPressed: () {},
            label: Text("Стать волонтёром", style: styles.mainTextTheme.titleSmall),
            icon: const Icon(Icons.arrow_forward_ios)),
        const SizedBox(
          height: 15,
        ),
        ElevatedButtonRightIcon(
            onPressed: () {},
            label: Text("Подать заявку на поиск", style: styles.mainTextTheme.titleSmall),
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
