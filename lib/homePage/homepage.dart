import 'package:flutter/material.dart';
import 'package:kids_math_play/homePage/homeUtils.dart';
import 'package:kids_math_play/mathgame/ui.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyChip(
                text: 'Calculator',
                icon: Icons.calculate_outlined,
                onp: () {},
              ),
              Lottie.asset(
                'assets/lottie/100_percent.json',
                fit: BoxFit.fill,
              ),
              MyChip(
                text: 'Math Game',
                icon: Icons.games_outlined,
                onp: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MathUi()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
