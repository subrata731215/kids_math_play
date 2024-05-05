import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final Function() onp;
  Color? buttonColor;

  Buttons(
      {super.key,
      required this.buttonText,
      required this.onp,
      this.buttonColor = Colors.yellow});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onp,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor,
        ),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
