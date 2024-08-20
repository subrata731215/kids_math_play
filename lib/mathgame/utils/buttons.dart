import 'package:flutter/material.dart';
import '../../utils/textstyle.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Function() onp;
  final Color? textColor;

  const MyButtons(
      {super.key,
      required this.buttonText,
      required this.onp,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onp,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        child: Center(
          child: Text(
            buttonText,
            style: textStyle.copyWith(fontSize: 40, color: textColor),
          ),
        ),
      ),
    );
  }
}
