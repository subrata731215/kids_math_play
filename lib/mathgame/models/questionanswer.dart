import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
part 'questionanswer.g.dart';

@HiveType(typeId: 0)
class QuestionAnswer {
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

  QuestionAnswer(
      {required this.firstNoo,
      required this.mathSign,
      required this.secondNoo,
      required this.answer,
      required this.icon,
      required this.tileColor});
}
