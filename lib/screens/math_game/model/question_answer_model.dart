import 'package:flutter/cupertino.dart';

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
