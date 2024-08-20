import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_math_play/homePage/homepage.dart';
import 'package:kids_math_play/mathgame/model/ques_ans_model.dart';

import 'mathgame/hive_services/services.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionAnswerModelWithHiveAdapter());
  await HiveServices().openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, home: HomePage(),
      //HomePage(),
    );
  }
}
