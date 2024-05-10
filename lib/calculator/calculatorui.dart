import 'package:flutter/material.dart';
import 'package:kids_math_play/calculator/calculatorcontroller.dart';
import 'package:kids_math_play/chatdetails/authpage.dart';
import 'package:kids_math_play/mathgame/utils.dart';
import 'package:reactiv/reactiv.dart';

class CalculatorUi extends ReactiveStateWidget<CalculatorController> {
  @override
  BindController<CalculatorController>? bindController() {
    return BindController(controller: () => CalculatorController());
  }

  CalculatorUi({super.key});

  void secretChatDetailsOpen(BuildContext context) {
    if (controller.userText.value == '731215') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculator',
          style: textStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(
                      listenable: controller.userText,
                      listener: (userText) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userText,
                            style: textStyle,
                          ),
                        );
                      }),
                  Observer(
                      listenable: controller.userAnswer,
                      listener: (userAnswer) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userAnswer,
                            style: textStyle.copyWith(
                                color: Colors.green, fontSize: 50),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurpleAccent,
              child: GridView.builder(
                  itemCount: buttonText.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (buttonText[index] == 'C') {
                      return MyButtons(
                        buttonText: buttonText[index],
                        onp: () {
                          controller.userText.value = '';
                          controller.userAnswer.value = '0';
                        },
                        textColor: Colors.white,
                      );
                    } else if (buttonText[index] == 'Del') {
                      return MyButtons(
                        buttonText: buttonText[index],
                        onp: () {
                          secretChatDetailsOpen(context);
                          if (controller.userText.value.isNotEmpty) {
                            controller.userText.value =
                                controller.userText.value.substring(
                                    0, controller.userText.value.length - 1);
                          }
                        },
                        textColor: Colors.white,
                      );
                    } else if (buttonText[index] == '=' ||
                        buttonText[index] == 'Ans') {
                      return MyButtons(
                        buttonText: buttonText[index],
                        onp: () {
                          controller.mathCal();
                        },
                        textColor: Colors.cyanAccent,
                      );
                    } else {
                      return MyButtons(
                          buttonText: buttonText[index],
                          onp: () {
                            controller.userText.value += buttonText[index];
                          });
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  final List<String> buttonText = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];
}
