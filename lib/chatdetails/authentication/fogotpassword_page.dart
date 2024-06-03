import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_play/chatdetails/utils.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController forgotTEC = TextEditingController();

  void resetPassword() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotTEC.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                hintText: 'Enter Your Email',
                obs: false,
                textInputType: TextInputType.emailAddress,
                tecController: forgotTEC,
              ),
              const SizedBox(height: 30),
              MyTapButton(
                  buttonText: 'Send Reset Link',
                  onp: () {
                    showDialog(
                        context: context,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                    resetPassword();
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
