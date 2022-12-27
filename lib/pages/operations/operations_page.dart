import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

class OperationsPage extends ConsumerStatefulWidget {

  const OperationsPage({
    Key? key
  }) : super(key: key);

  @override
  ConsumerState createState() => _OperationsPageState();
}

class _OperationsPageState extends ConsumerState<OperationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(title: "Главная", onBack: () {}),
      body: Container(),
    );
  }
}
