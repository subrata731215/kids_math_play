import 'package:flutter/material.dart';
import 'package:kids_math_play/homePage/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.pink,
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
