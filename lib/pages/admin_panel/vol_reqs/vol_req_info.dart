import 'package:flutter/material.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../../components/text_builder.dart';
import '../../../generated/app_user.pb.dart';
import '../../../providers/providers.dart';

class VolReqInfoPage extends StatelessWidget {
  final AppUser reqInfo;

  const VolReqInfoPage({Key? key, required this.reqInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: "Заявка в волонтёры",
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              pairTextBuilder("Имя:", reqInfo.name),
              const SizedBox(height: 10,),
              pairTextBuilder("Фамилия:", reqInfo.surName),
              const SizedBox(height: 10,),
              pairTextBuilder("Email:", reqInfo.email),
              const SizedBox(height: 10,),
              pairTextBuilder("Область проживания:", reqInfo.volRequest.livArea),
              const SizedBox(height: 10,),
              pairTextBuilder("Пол:", sexMap[reqInfo.volRequest.sex] ?? ""),
              const SizedBox(height: 10,),
              pairTextBuilder("Возраст:", reqInfo.volRequest.age.toString()),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Принять"),),
                    ElevatedButton(onPressed: () {}, child: Text("Отклонить"),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
