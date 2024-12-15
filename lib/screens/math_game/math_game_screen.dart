import 'package:flutter/material.dart';
import 'package:kids_math_play/screens/math_game/utils/bottom_sheet_text.dart';
import 'package:kids_math_play/screens/math_game/utils/buttons.dart';
import 'package:kids_math_play/screens/math_game/utils/count_button.dart';
import 'package:reactiv/reactiv.dart';
import '../../common/button_text.dart';
import 'controller.dart';
import 'model/question_answer_model.dart';

class MathGameScreen extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    return BindController(controller: () => MathController());
  }

  const MathGameScreen({super.key});


  void buttonTapped(String button) {
    if (button.isEmpty) {
      controller.userAnswer.value = '?';
    }
    if (controller.userAnswer.value.length < 15) {
      controller.userAnswer.value += button;
    }
  }

  Icon checkedIcon() {
    if (controller.ansCheck()) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 25,
      );
    }
    return const Icon(
      Icons.close,
      color: Colors.white,
      size: 25,
    );
  }

  Color tileColorChecked() {
    if (controller.ansCheck()) {
      return Colors.green;
    }
    return Colors.red;
  }

  countCheck() {
    if (controller.ansCheck() == true) {
      controller.correctAnswer.value++;
    } else {
      controller.wrongAnswer.value++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            title: Text(
              'Math Game',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              Observer(
                  listenable: controller.wrongAnswer,
                  listener: (wrongAnswer) {
                    return CountButton(
                      count: wrongAnswer.toString(),
                      color: Colors.red,
                    );
                  }),
              const SizedBox(width: 10),
              Observer(
                  listenable: controller.correctAnswer,
                  listener: (correctAnswer) {
                    return CountButton(
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
                child: Observer(
                  listenable: controller.randMathBackImageNo,
                  listener: (no) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/math/back$no.jpg'),
                              opacity: 0.3,
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          Observer(
                              listenable: controller.digit,
                              listener: (digit) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: DropdownButton<int>(
                                    dropdownColor: Colors.black,
                                    padding: const EdgeInsets.all(10),
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
                                          style: bottomTextTextStyle.copyWith(
                                              fontSize: 30)),
                                      const SizedBox(width: 20),
                                      Text(controller.randMathSign(),
                                          style: bottomTextTextStyle.copyWith(
                                              fontSize: 30)),
                                      const SizedBox(width: 20),
                                      Text(controller.secondNo.value.toString(),
                                          textAlign: TextAlign.center,
                                          style: bottomTextTextStyle.copyWith(
                                              fontSize: 30)),
                                      const SizedBox(width: 20),
                                      Text('=',
                                          style: bottomTextTextStyle.copyWith(
                                              fontSize: 30)),
                                      const SizedBox(width: 20),
                                      Observer(
                                          listenable: controller.userAnswer,
                                          listener: (answer) {
                                            return Flexible(
                                              child: Container(
                                                padding: const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                child: Text(answer,
                                                    textAlign: TextAlign.center,
                                                    style: bottomTextTextStyle
                                                        .copyWith(fontSize: 30)),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: GridView.builder(
                    itemCount: mathButtonText.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (mathButtonText[index] == 'C') {
                        return MyButtons(
                          textColor: Colors.red,
                          onp: () {
                            if (mathButtonText.isNotEmpty) {
                              controller.userAnswer.value = '?';
                            }
                          },
                          buttonText: mathButtonText[index],
                        );
                      } else if (mathButtonText[index] == 'Del') {
                        return MyButtons(
                          textColor: Colors.red,
                          onp: () {
                            if (controller.userAnswer.value.isNotEmpty) {
                              controller.userAnswer.value =
                                  controller.userAnswer.value.substring(0,
                                      controller.userAnswer.value.length - 1);
                            }
                            if (controller.userAnswer.value.isEmpty) {
                              controller.userAnswer.value = '?';
                            }
                          },
                          buttonText: mathButtonText[index],
                        );
                      } else if (mathButtonText[index] == '=') {
                        return MyButtons(
                          textColor: Colors.cyan,
                          onp: () {
                            if (controller.userAnswer.value != '?') {
                              controller.questionAnswerList.add(
                                  QuestionAnswerModel(
                                      firstNoo: controller.firstNo.value,
                                      mathSign: controller.mathSign.value,
                                      secondNoo: controller.secondNo.value,
                                      answer: controller.userAnswer.value,
                                      icon: checkedIcon(),
                                      tileColor: tileColorChecked()));

                              shownDialog(context);
                              controller.randMathBack();
                              countCheck();
                              controller.digitCheck();
                              controller.userAnswer.value = '?';
                            }
                          },
                          buttonText: mathButtonText[index],
                        );
                      } else if (mathButtonText[index] == 'skip') {
                        return Observer3(
                            listenable: controller.firstNo,
                            listenable2: controller.secondNo,
                            listenable3: controller.digit,
                            listener: (fno, sno, digit) {
                              return MyButtons(
                                textColor: Colors.cyan,
                                onp: () {
                                  controller.digitCheck();
                                  controller.userAnswer.value = '?';
                                },
                                buttonText: mathButtonText[index],
                              );
                            });
                      } else {
                        return MyButtons(
                          onp: () {
                            if (controller.userAnswer.value == '?') {
                              controller.userAnswer.value = '';
                            }

                            buttonTapped(mathButtonText[index]);
                          },
                          buttonText: mathButtonText[index],
                        );
                      }
                    }),
              ),
            ],
          )),
    );
  }

  shownDialog(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 70),
      backgroundColor: controller.ansCheck() ? Colors.green : Colors.red,
      content: Center(
        child: Text(
          controller.ansCheck() ? 'CORRECT' : 'WRONG',
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    ));
  }
}
