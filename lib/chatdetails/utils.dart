import 'package:flutter/material.dart';
import '../utils/textstyle.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obs;
  final IconButton? iconButton;
  final TextInputType textInputType;
  final TextEditingController tecController;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obs,
      this.iconButton,
      required this.textInputType,
      required this.tecController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tecController,
      keyboardType: textInputType,
      obscureText: obs,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: iconButton,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 4),
          ),
          filled: true,
          fillColor: Colors.grey.shade200),
    );
  }
}

class MyTapButton extends StatelessWidget {
  final String buttonText;
  final Function() onp;

  const MyTapButton({super.key, required this.buttonText, required this.onp});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.green.shade100,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8)),
      onPressed: onp,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}

Future exceptionDialog(BuildContext context, String e) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(e, textAlign: TextAlign.center),
          ));
}
