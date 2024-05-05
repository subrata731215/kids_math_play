import 'dart:math';
import 'package:reactiv/reactiv.dart';

class MathController extends ReactiveController {
  ReactiveString userAnswer = ReactiveString('?');

  ReactiveInt firstNo = ReactiveInt(Random().nextInt(100));
  ReactiveInt secondNo = ReactiveInt(Random().nextInt(100));

  List<String> mathSignList = ['+', '-', 'x'];
  ReactiveString mathSign = ReactiveString('');

  String randMathSign() {
    return mathSign.value = mathSignList[Random().nextInt(3)];
  }

  bool ansCheck() {
    // switch (mathSign.value) {
    //   case '+':
    //     firstNo.value + secondNo.value;
    //     break;
    //   case '-':
    //     firstNo.value - secondNo.value;
    //     break;
    //   case 'x':
    //     firstNo.value * secondNo.value;
    //     break;
    //   case '/':
    //     firstNo.value / secondNo.value;
    //     break;
    // }

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

  void buttonTapped(String button) {
    if (button.isEmpty) {
      userAnswer.value = '?';
    }
    if (userAnswer.value.length < 5) {
      userAnswer.value += button;
    }
  }
}
