import 'package:math_expressions/math_expressions.dart';
import 'package:reactiv/reactiv.dart';

class CalculatorController extends ReactiveController {
  ReactiveString userText = ReactiveString('');
  ReactiveString userAnswer = ReactiveString('0');

  void mathCal() {
    Parser p = Parser();
    var finalUserText = userText.value;
    finalUserText = finalUserText.replaceAll('x', '*');
    Expression expression = p.parse(finalUserText);
    ContextModel cm = ContextModel();
    var result = expression.evaluate(EvaluationType.REAL, cm);
    userAnswer.value = result.toString();
  }
}
