import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

part 'ques_ans_model.g.dart';

@HiveType(typeId: 0)
class QuestionAnswerModelWithHive {
  @HiveField(0)
  int firstNoo;

  @HiveField(1)
  String mathSign;

  @HiveField(2)
  int secondNoo;

  @HiveField(3)
  String answer;

  @HiveField(4)
  Icon icon;

  @HiveField(5)
  Color tileColor;

  QuestionAnswerModelWithHive(
      {required this.firstNoo,
      required this.mathSign,
      required this.secondNoo,
      required this.answer,
      required this.icon,
      required this.tileColor});
}
