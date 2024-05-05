import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_math_play/utils.dart';
import 'package:reactiv/reactiv.dart';
import 'controller.dart';

class MathUi extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => MathController());
  }

  const MathUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.amberAccent),
              child: Column(
                children: [
                  Observer2(
                      listenable: controller.correctAnswer,
                      listenable2: controller.wrongAnswer,
                      listener: (correct, wrong) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Text(
                                controller.wrongAnswer.value.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Text(
                                controller.correctAnswer.value.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          ],
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 78.0),
                    child: Observer2(
                        listenable: controller.firstNo,
                        listenable2: controller.secondNo,
                        listener: (fno, sno) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.firstNo.value.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                controller.randMathSign(),
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                controller.secondNo.value.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                '=',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
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
                                        child: Text(
                                          answer,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.buttonText.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (controller.buttonText[index] == 'C') {
                      return Buttons(
                        buttonColor: Colors.green,
                        onp: () {
                          if (controller.buttonText.isNotEmpty) {
                            controller.userAnswer.value = '?';
                          }
                        },
                        buttonText: controller.buttonText[index],
                      );
                    } else if (controller.buttonText[index] == 'Del') {
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
                        buttonText: controller.buttonText[index],
                      );
                    } else if (controller.buttonText[index] == '=') {
                      return Buttons(
                        buttonColor: Colors.deepPurpleAccent,
                        onp: () {
                          if (controller.userAnswer.value != '?') {
                            shownDialog(context);
                            controller.countCheck();
                            controller.firstNo.value = Random().nextInt(100);
                            controller.secondNo.value = Random().nextInt(100);
                            controller.userAnswer.value = '?';
                          }
                        },
                        buttonText: controller.buttonText[index],
                      );
                    } else if (controller.buttonText[index] == '>') {
                      return Buttons(
                        buttonColor: Colors.orange,
                        onp: () {
                          controller.firstNo.value = Random().nextInt(100);
                          controller.secondNo.value = Random().nextInt(100);
                          controller.userAnswer.value = '?';
                        },
                        buttonText: controller.buttonText[index],
                      );
                    } else {
                      return Buttons(
                        onp: () {
                          if (controller.userAnswer.value == '?') {
                            controller.userAnswer.value = '';
                          }

                          controller.buttonTapped(controller.buttonText[index]);
                        },
                        buttonText: controller.buttonText[index],
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future shownDialog(BuildContext context) {
    return controller.ansCheck()
        ? showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Correct'),
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 30,
                  ),
                ))
        : showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Wrong'),
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30,
                  ),
                ));
  }
}
