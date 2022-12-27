import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import 'common_content.dart';

class CommonPage extends ConsumerStatefulWidget {

  const CommonPage({
    Key? key
  }) : super(key: key);

  @override
  ConsumerState createState() => _CommonPagePageState();
}

class _CommonPagePageState extends ConsumerState<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(title: "Главная"),
      body: Padding(padding: EdgeInsets.all(15),child: const CommonContent())
    );
  }
}
