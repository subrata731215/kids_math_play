import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function() onp;

  const MyChip(
      {super.key, required this.text, required this.icon, required this.onp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onp,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
