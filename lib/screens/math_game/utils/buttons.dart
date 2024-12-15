import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Function() onp;
  final Color? textColor;

  const MyButtons(
      {super.key,
      required this.buttonText,
      required this.onp,
      this.textColor = Colors.white70});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onp,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
