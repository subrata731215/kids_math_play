import 'package:flutter/material.dart';
import 'package:kids_math_play/chatdetails/controller/chatpagecontroller.dart';
import 'package:kids_math_play/chatdetails/authentication/fogotpassword_page.dart';
import 'package:kids_math_play/chatdetails/authentication/signup_page.dart';
import 'package:kids_math_play/chatdetails/utils.dart';
import 'package:reactiv/reactiv.dart';
import '../../utils/textstyle.dart';
import '../all_method/all_method.dart';

class SignInPage extends ReactiveStateWidget<ChatPageController> {
  @override
  BindController<ChatPageController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => ChatPageController());
  }

  SignInPage({super.key});

  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

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
              const Hero(tag: 'lock', child: Icon(Icons.lock, size: 100)),
              Text('Welcome Back', style: textStyle),
              const SizedBox(height: 20),
              MyTextField(
                  tecController: emailTEC,
                  hintText: 'Email',
                  obs: false,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              Observer(
                  listenable: controller.visible,
                  listener: (vv) {
                    return MyTextField(
                      tecController: passwordTEC,
                      hintText: 'Password',
                      obs: controller.visible.value,
                      textInputType: TextInputType.text,
                      iconButton: IconButton(
                          onPressed: () {
                            controller.visible.value =
                                !controller.visible.value;
                          },
                          icon: controller.visible.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    );
                  }),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 10),
              MyTapButton(
                  buttonText: 'Sign In',
                  onp: () {
                    signInUser(context, emailTEC.text, passwordTEC.text);
                  }),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: RichText(
                    text: TextSpan(
                        text: 'You have no account ?',
                        style: textStyle.copyWith(
                            color: Colors.grey.shade400, fontSize: 20),
                        children: [
                      TextSpan(
                          text: 'Sign Up',
                          style: textStyle.copyWith(color: Colors.green))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
