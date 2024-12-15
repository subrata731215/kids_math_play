import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

import 'model/question_answer_model.dart';

class MathController extends ReactiveController {
  ReactiveInt digit = ReactiveInt(1);
  ReactiveString userAnswer = ReactiveString('?');
  ReactiveInt firstNo = ReactiveInt(Random().nextInt(10));
  ReactiveInt secondNo = ReactiveInt(Random().nextInt(10));

  List<String> mathSignList = ['+', '-', 'x', '/'];
  ReactiveString mathSign = ReactiveString('');

  final List<QuestionAnswerModel> questionAnswerList = [];
  ReactiveInt correctAnswer = ReactiveInt(0);
  ReactiveInt wrongAnswer = ReactiveInt(0);

  int randomUpTo(int upTo) {
    return Random().nextInt(upTo);
  }

  String randMathSign() {
    return mathSign.value = mathSignList[randomUpTo(4)];
  }

  ReactiveInt randMathBackImageNo=ReactiveInt(0);

  int randMathBack() {
    return randMathBackImageNo.value = randomUpTo(7);
  }

  void digitCheck() {
    switch (digit.value) {
      case 1:
        firstNo.value = randomUpTo(10);
        secondNo.value = randomUpTo(10);
      case 2:
        firstNo.value = randomUpTo(100);
        secondNo.value = randomUpTo(100);
      case 3:
        firstNo.value = randomUpTo(1000);
        secondNo.value = randomUpTo(1000);
      case 4:
        firstNo.value = randomUpTo(10000);
        secondNo.value = randomUpTo(10000);
    }
  }

  bool ansCheck() {
    switch (mathSign.value) {
      case '+':
        if (firstNo.value + secondNo.value == double.parse(userAnswer.value)) {
          return true;
        }
      case '-':
        if (firstNo.value - secondNo.value == double.parse(userAnswer.value)) {
          return true;
        }
      case 'x':
        if (firstNo.value * secondNo.value == double.parse(userAnswer.value)) {
          return true;
        }
      case '/':
        if (firstNo.value / secondNo.value == double.parse(userAnswer.value)) {
          return true;
        }
    }
    return false;
  }
}
