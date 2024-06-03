import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_play/mathgame/utils.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        FirebaseAuth.instance.currentUser!.email.toString(),
        style: textStyle,
      ),
    );
  }
}
