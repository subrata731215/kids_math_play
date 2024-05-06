import 'dart:math';
import 'package:reactiv/reactiv.dart';

class MathController extends ReactiveController {
  ReactiveString userAnswer = ReactiveString('?');

  ReactiveInt firstNo = ReactiveInt(Random().nextInt(10));
  ReactiveInt secondNo = ReactiveInt(Random().nextInt(10));

  List<String> mathSignList = ['+', '-', 'x'];
  ReactiveString mathSign = ReactiveString('');

  String randMathSign() {
    return mathSign.value = mathSignList[Random().nextInt(3)];
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
    }
    return false;
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
    if (userAnswer.value.length < 5) {
      userAnswer.value += button;
    }
  }

  List<QuestionAnswerModel> questionAnswerList = [];
}

class QuestionAnswerModel {
  int firstNoo;
  String mathSign;
  int secondNoo;
  String answer;

  QuestionAnswerModel(
      {required this.firstNoo,
      required this.mathSign,
      required this.secondNoo,
      required this.answer});
}
