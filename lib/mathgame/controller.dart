import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class MathController extends ReactiveController {
  int randomUpTo(int upTo) {
    return Random().nextInt(upTo);
  }



  ReactiveInt digit = ReactiveInt(1);

  ReactiveString userAnswer = ReactiveString('?');

  ReactiveInt firstNo = ReactiveInt(Random().nextInt(10));
  ReactiveInt secondNo = ReactiveInt(Random().nextInt(10));

  List<String> mathSignList = ['+', '-', 'x', '/'];
  ReactiveString mathSign = ReactiveString('');

  String randMathSign() {
    return mathSign.value = mathSignList[randomUpTo(4)];
  }

  void digitCheck() {
    if (digit.value == 1) {
      firstNo.value = randomUpTo(10);
      secondNo.value = randomUpTo(10);
    } else if (digit.value == 2) {
      firstNo.value = randomUpTo(100);
      secondNo.value = randomUpTo(100);
    } else if (digit.value == 3) {
      firstNo.value = randomUpTo(1000);
      secondNo.value = randomUpTo(1000);
    } else {
      firstNo.value = randomUpTo(10000);
      secondNo.value = randomUpTo(10000);
    }
  }

  bool ansCheck() {
    if (mathSign.value == '+') {
      if (firstNo.value + secondNo.value == int.parse(userAnswer.value)) {
        return true;
      }
    } else if (mathSign.value == '-') {
      if (firstNo.value - secondNo.value == int.parse(userAnswer.value)) {
        return true;
      }
    } else if (mathSign.value == 'x') {
      if (firstNo.value * secondNo.value == int.parse(userAnswer.value)) {
        return true;
      }
    } else if (mathSign.value == '/') {
      if (firstNo.value / secondNo.value == double.parse(userAnswer.value)) {
        return true;
      }
    }
    return false;
  }

  Icon checkedIcon() {
    if (ansCheck()) {
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
    if (ansCheck()) {
      return Colors.green;
    }
    return Colors.red;
  }

  ReactiveInt correctAnswer = ReactiveInt(0);
  ReactiveInt wrongAnswer = ReactiveInt(0);

  countCheck() {
    if (ansCheck() == true) {
      correctAnswer.value++;
    } else {
      wrongAnswer.value++;
    }
  }

  void buttonTapped(String button) {
    if (button.isEmpty) {
      userAnswer.value = '?';
    }
    if (userAnswer.value.length < 15) {
      userAnswer.value += button;
    }
  }

  final List<QuestionAnswerModel> questionAnswerList = [];
}

class QuestionAnswerModel {
  int firstNoo;
  String mathSign;
  int secondNoo;
  String answer;
  Icon icon;
  Color tileColor;

  QuestionAnswerModel(
      {required this.firstNoo,
      required this.mathSign,
      required this.secondNoo,
      required this.answer,
      required this.icon,
      required this.tileColor});
}
