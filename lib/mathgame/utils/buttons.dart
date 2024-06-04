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
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onp,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.green,
                      Colors.red,
                      Colors.yellow
                    ])),
            margin: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                buttonText,
                style: textStyle.copyWith(fontSize: 40, color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
