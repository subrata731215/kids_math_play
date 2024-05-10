import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_math_play/mathgame/utils.dart';
import 'package:reactiv/reactiv.dart';
import 'controller.dart';

class MathUi extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    return BindController(controller: () => MathController());
  }

  MathUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[700],
        centerTitle: true,
        title: Text(
          'Math Game',
          style: textStyle,
        ),
        actions: [
          Observer(
              listenable: controller.correctAnswer,
              listener: (correctAnswer) {
                return MyCirCleAvatar(
                  count: correctAnswer.toString(),
                  color: Colors.green,
                );
              }),
          const SizedBox(width: 10),
          Observer(
              listenable: controller.wrongAnswer,
              listener: (wrongAnswer) {
                return MyCirCleAvatar(
                  count: wrongAnswer.toString(),
                  color: Colors.red,
                );
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.yellow
              ])),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Observer2(
                      listenable: controller.firstNo,
                      listenable2: controller.secondNo,
                      listener: (fno, sno) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.firstNo.value.toString(),
                                textAlign: TextAlign.center,
                                style: textStyle.copyWith(fontSize: 45)),
                            const SizedBox(width: 20),
                            Text(controller.randMathSign(),
                                style: textStyle.copyWith(fontSize: 45)),
                            const SizedBox(width: 20),
                            Text(controller.secondNo.value.toString(),
                                textAlign: TextAlign.center,
                                style: textStyle.copyWith(fontSize: 45)),
                            const SizedBox(width: 20),
                            Text('=', style: textStyle.copyWith(fontSize: 45)),
                            const SizedBox(width: 20),
                            Observer(
                                listenable: controller.userAnswer,
                                listener: (answer) {
                                  return Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(answer,
                                          textAlign: TextAlign.center,
                                          style:
                                              textStyle.copyWith(fontSize: 45)),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }),
                  // Expanded(child: Lottie.asset('assets/lottie/birds.json')),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: buttonText.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (buttonText[index] == 'C') {
                    return MyButtons(
                      textColor: Colors.green,
                      onp: () {
                        if (buttonText.isNotEmpty) {
                          controller.userAnswer.value = '?';
                        }
                      },
                      buttonText: buttonText[index],
                    );
                  } else if (buttonText[index] == 'Del') {
                    return MyButtons(
                      textColor: Colors.lightGreenAccent,
                      onp: () {
                        if (controller.userAnswer.value.isNotEmpty) {
                          controller.userAnswer.value =
                              controller.userAnswer.value.substring(
                                  0, controller.userAnswer.value.length - 1);
                        }
                        if (controller.userAnswer.value.isEmpty) {
                          controller.userAnswer.value = '?';
                        }
                      },
                      buttonText: buttonText[index],
                    );
                  } else if (buttonText[index] == '=') {
                    return MyButtons(
                      textColor: Colors.white,
                      onp: () {
                        controller.questionAnswerList.add(QuestionAnswerModel(
                            firstNoo: controller.firstNo.value,
                            mathSign: controller.mathSign.value,
                            secondNoo: controller.secondNo.value,
                            answer: controller.userAnswer.value));
                        if (controller.userAnswer.value != '?') {
                          shownDialog(context);
                          controller.countCheck();
                          controller.firstNo.value = Random().nextInt(10);
                          controller.secondNo.value = Random().nextInt(10);

                          controller.userAnswer.value = '?';
                        }
                      },
                      buttonText: buttonText[index],
                    );
                  } else if (buttonText[index] == '>') {
                    return MyButtons(
                      textColor: Colors.cyan,
                      onp: () {
                        controller.firstNo.value = Random().nextInt(10);
                        controller.secondNo.value = Random().nextInt(10);
                        controller.userAnswer.value = '?';
                      },
                      buttonText: buttonText[index],
                    );
                  } else {
                    return MyButtons(
                      onp: () {
                        if (controller.userAnswer.value == '?') {
                          controller.userAnswer.value = '';
                        }

                        controller.buttonTapped(buttonText[index]);
                      },
                      buttonText: buttonText[index],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  shownDialog(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 70),
      backgroundColor: controller.ansCheck() ? Colors.green : Colors.red,
      content: Center(
        child: Text(
          controller.ansCheck() ? 'Correct' : 'Wrong',
          style: textStyle,
        ),
      ),
    ));
  }

  final List buttonText = [
    '1',
    '2',
    '3',
    'C',
    '4',
    '5',
    '6',
    'Del',
    '7',
    '8',
    '9',
    '>',
    '0',
    '.',
    '-',
    '='
  ];
}
