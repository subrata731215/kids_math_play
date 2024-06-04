import 'package:flutter/material.dart';
import '../utils/textstyle.dart';

class MyChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onp;

  const MyChip(
      {super.key, required this.text, required this.icon, required this.onp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onp,
      child: Card(
        color: Colors.blueGrey[100],
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              const SizedBox(width: 30),
              Text(
                text,
                style: textStyle.copyWith(color: Colors.teal),
              ),
              const SizedBox(width: 30),
              //Lottie.asset('assets/lottie/arrow.json', height: 30, width: 90)
            ],
          ),
        ),
      ),
    );
  }
}
