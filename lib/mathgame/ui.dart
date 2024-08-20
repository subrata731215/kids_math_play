import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_play/mathgame/utils/buttons.dart';
import 'package:kids_math_play/mathgame/utils/circlecount_button.dart';
import 'package:reactiv/reactiv.dart';
import '../utils/textstyle.dart';
import 'controller.dart';

class MathUi extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    return BindController(controller: () => MathController());
  }

  MathUi({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Math Game',
            style: textStyle,
          ),
          actions: [
            Observer(
                listenable: controller.wrongAnswer,
                listener: (wrongAnswer) {
                  return MyCirCleAvatar(
                    count: wrongAnswer.toString(),
                    color: Colors.red,
                  );
                }),
            const SizedBox(width: 10),
            Observer(
                listenable: controller.correctAnswer,
                listener: (correctAnswer) {
                  return MyCirCleAvatar(
                    count: correctAnswer.toString(),
                    color: Colors.green,
                  );
                }),
            const SizedBox(width: 10),
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
                    Observer(
                        listenable: controller.digit,
                        listener: (digit) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: DropdownButton<int>(
                              value: controller.digit.value,
                              onChanged: (nVal) {
                                controller.digit.value = nVal!;
                              },
                              items: const [
                                DropdownMenuItem<int>(
                                    value: 1, child: Text('Easy')),
                                DropdownMenuItem<int>(
                                    value: 2, child: Text('Medium')),
                                DropdownMenuItem<int>(
                                    value: 3, child: Text('Hard')),
                                DropdownMenuItem<int>(
                                    value: 4, child: Text('Extreme')),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(height: 20),
                    Observer2(
                        listenable: controller.firstNo,
                        listenable2: controller.secondNo,
                        listener: (fno, sno) {
                          return Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.firstNo.value.toString(),
                                    textAlign: TextAlign.center,
                                    style: textStyle.copyWith(fontSize: 30)),
                                const SizedBox(width: 20),
                                Text(controller.randMathSign(),
                                    style: textStyle.copyWith(fontSize: 30)),
                                const SizedBox(width: 20),
                                Text(controller.secondNo.value.toString(),
                                    textAlign: TextAlign.center,
                                    style: textStyle.copyWith(fontSize: 30)),
                                const SizedBox(width: 20),
                                Text('=',
                                    style: textStyle.copyWith(fontSize: 30)),
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
                                              style: textStyle.copyWith(
                                                  fontSize: 30)),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                  itemCount: calButtonText.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (calButtonText[index] == 'C') {
                      return MyButtons(
                        textColor: Colors.green,
                        onp: () {
                          if (calButtonText.isNotEmpty) {
                            controller.userAnswer.value = '?';
                          }
                        },
                        buttonText: calButtonText[index],
                      );
                    } else if (calButtonText[index] == 'Del') {
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
                        buttonText: calButtonText[index],
                      );
                    } else if (calButtonText[index] == '=') {
                      return MyButtons(
                        textColor: Colors.white,
                        onp: () {
                          if (controller.userAnswer.value != '?') {
                            controller.questionAnswerList.add(
                                QuestionAnswerModel(
                                    firstNoo: controller.firstNo.value,
                                    mathSign: controller.mathSign.value,
                                    secondNoo: controller.secondNo.value,
                                    answer: controller.userAnswer.value,
                                    icon: controller.checkedIcon(),
                                    tileColor: controller.tileColorChecked()));

                            shownDialog(context);
                            controller.countCheck();
                            controller.digitCheck();
                            controller.userAnswer.value = '?';
                          }
                        },
                        buttonText: calButtonText[index],
                      );
                    } else if (calButtonText[index] == 'skip') {
                      return Observer3(
                          listenable: controller.firstNo,
                          listenable2: controller.secondNo,
                          listenable3: controller.digit,
                          listener: (fno, sno, digi) {
                            return MyButtons(
                              textColor: Colors.cyan,
                              onp: () {
                                controller.digitCheck();
                                controller.userAnswer.value = '?';
                              },
                              buttonText: calButtonText[index],
                            );
                          });
                    } else {
                      return MyButtons(
                        onp: () {
                          if (controller.userAnswer.value == '?') {
                            controller.userAnswer.value = '';
                          }

                          controller.buttonTapped(calButtonText[index]);
                        },
                        buttonText: calButtonText[index],
                      );
                    }
                  }),
            ),
          ],
        ));
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

  final List calButtonText = [
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
    'skip',
    '0',
    '.',
    '-',
    '='
  ];
}
