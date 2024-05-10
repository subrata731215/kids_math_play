import 'package:flutter/material.dart';
import 'package:kids_math_play/homePage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
