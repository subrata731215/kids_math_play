import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_math_play/utils.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(color: Colors.amberAccent),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Observer2(
                      listenable: controller.correctAnswer,
                      listenable2: controller.wrongAnswer,
                      listener: (correct, wrong) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (controller
                                        .questionAnswerList.isNotEmpty) {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => ListView.builder(
                                            itemCount: controller
                                                .questionAnswerList.length,
                                            itemBuilder: (context, index) =>
                                                ListTile(
                                                  leading: Text(
                                                      '${controller.questionAnswerList.length - index})',
                                                      style: textStyle),
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          controller
                                                              .questionAnswerList[
                                                                  index]
                                                              .firstNoo
                                                              .toString(),
                                                          style: textStyle),
                                                      Text(
                                                          controller
                                                              .questionAnswerList[
                                                                  index]
                                                              .mathSign,
                                                          style: textStyle),
                                                      Text(
                                                          controller
                                                              .questionAnswerList[
                                                                  index]
                                                              .secondNoo
                                                              .toString(),
                                                          style: textStyle),
                                                      Text('=',
                                                          style: textStyle),
                                                      Observer(
                                                          listenable: controller
                                                              .userAnswer,
                                                          listener: (context) {
                                                            return Text(
                                                                controller
                                                                    .questionAnswerList[
                                                                        index]
                                                                    .answer
                                                                    .toString(),
                                                                style:
                                                                    textStyle);
                                                          }),
                                                    ],
                                                  ),
                                                )),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.line_weight_outlined)),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                        controller.correctAnswer.value
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: textStyle.copyWith(
                                            color: Colors.green)),
                                  ),
                                  const SizedBox(height: 10),
                                  CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                      controller.wrongAnswer.value.toString(),
                                      textAlign: TextAlign.center,
                                      style:
                                          textStyle.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                  Observer2(
                      listenable: controller.firstNo,
                      listenable2: controller.secondNo,
                      listener: (fno, sno) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.firstNo.value.toString(),
                                textAlign: TextAlign.center, style: textStyle),
                            const SizedBox(width: 20),
                            Text(controller.randMathSign(), style: textStyle),
                            const SizedBox(width: 20),
                            Text(controller.secondNo.value.toString(),
                                textAlign: TextAlign.center, style: textStyle),
                            const SizedBox(width: 20),
                            Text('=', style: textStyle),
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
                                          style: textStyle),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: buttonText.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1, crossAxisSpacing: 2, crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (buttonText[index] == 'C') {
                    return Buttons(
                      buttonColor: Colors.green,
                      onp: () {
                        if (buttonText.isNotEmpty) {
                          controller.userAnswer.value = '?';
                        }
                      },
                      buttonText: buttonText[index],
                    );
                  } else if (buttonText[index] == 'Del') {
                    return Buttons(
                      buttonColor: Colors.red,
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
                    return Buttons(
                      buttonColor: Colors.deepPurpleAccent,
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
                    return Buttons(
                      buttonColor: Colors.cyan,
                      onp: () {
                        controller.firstNo.value = Random().nextInt(10);
                        controller.secondNo.value = Random().nextInt(10);
                        controller.userAnswer.value = '?';
                      },
                      buttonText: buttonText[index],
                    );
                  } else {
                    return Buttons(
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
    return controller.ansCheck()
        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Correct',
                  style: textStyle,
                ),
                const Icon(
                  Icons.check,
                  size: 40,
                )
              ],
            ),
          ))
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wrong',
                  style: textStyle,
                ),
                const Icon(
                  Icons.close,
                  size: 40,
                )
              ],
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
