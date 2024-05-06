import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final Function() onp;
  final Color? buttonColor;

  const Buttons(
      {super.key,
      required this.buttonText,
      required this.onp,
      this.buttonColor = Colors.yellow});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onp,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor,
        ),
        margin: const EdgeInsets.all(5),
        child: Center(
          child: Text(
            buttonText,
            style: textStyle.copyWith(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle = const TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
