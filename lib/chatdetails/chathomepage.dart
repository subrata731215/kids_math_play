import 'package:flutter/material.dart';
import 'package:kids_math_play/chatdetails/drawer.dart';
import 'package:kids_math_play/mathgame/utils.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'HomePage',
            style: textStyle,
          ),
        ),
        body: Center(child: Text('Log In')));
  }
}
