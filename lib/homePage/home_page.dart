import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_math_play/homePage/widgets/my_chip.dart';
import '../screens/math_game/math_game_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: MyChip(
            text: 'Math Game',
            icon: SvgPicture.asset(
              'assets/images/maths_game_logo.svg',
              fit: BoxFit.fill,
              height: 130,
              width: 130,
            ),
            onp: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MathGameScreen()));
            },
          ),
        ),
      ),
    );
  }
}
