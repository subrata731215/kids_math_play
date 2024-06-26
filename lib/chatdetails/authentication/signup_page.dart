import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_play/chatdetails/controller/chatpagecontroller.dart';
import 'package:kids_math_play/chatdetails/authentication/signin_page.dart';
import 'package:kids_math_play/chatdetails/utils.dart';
import 'package:reactiv/reactiv.dart';

import '../all_method/all_method.dart';

class SignUpPage extends ReactiveStateWidget<ChatPageController> {
  @override
  BindController<ChatPageController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => ChatPageController());
  }

  SignUpPage({super.key});

  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController rePasswordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(tag: 'lock', child: Icon(Icons.lock, size: 180)),
              const SizedBox(height: 20),
              MyTextField(
                tecController: emailTEC,
                hintText: 'Email',
                obs: false,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              MyTextField(
                tecController: passwordTEC,
                hintText: 'Password',
                obs: controller.visible.value,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              Observer(
                  listenable: controller.visible,
                  listener: (vv) {
                    return MyTextField(
                        tecController: rePasswordTEC,
                        hintText: 'Re Enter Password',
                        obs: controller.visible.value,
                        textInputType: TextInputType.text,
                        iconButton: IconButton(
                            onPressed: () {
                              controller.visible.value =
                                  !controller.visible.value;
                            },
                            icon: controller.visible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)));
                  }),
              const SizedBox(height: 20),
              MyTapButton(
                  buttonText: 'Sign Up',
                  onp: () {
                    signUpUser(context, emailTEC.text, passwordTEC.text);
                    addToFireStoreData(emailTEC.text, passwordTEC.text);
                  }),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Already have an account ?',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 18),
                        children: const [
                      TextSpan(
                          text: ' Sign in',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 28,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
