import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_math_play/chatdetails/authentication/authpage.dart';
import 'package:kids_math_play/homePage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kids_math_play/mathgame/models/questionanswer.dart';
import 'package:kids_math_play/mathgame/services/question_answer_services.dart';
import 'package:kids_math_play/mathgame/ui.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionAnswerAdapter());
  await QuestionAnswerServices().openBox();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAAOWjVv6SGWHeFF4pvJ52t_whlBsyn8as",
          appId: "1:691758258540:android:003e60227849ca1ded3b49",
          messagingSenderId: "calculator-with-chatapp.appspot.com",
          projectId: "calculator-with-chatapp"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()
        //HomePage(),
        );
  }
}
