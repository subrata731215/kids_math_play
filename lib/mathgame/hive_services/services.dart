import 'package:hive_flutter/adapters.dart';
import 'package:kids_math_play/mathgame/model/ques_ans_model.dart';

class HiveServices {
  Box<QuestionAnswerModelWithHive>? _questionBox;

  Future<void> openBox() async {
    _questionBox = await Hive.openBox('questionAnswer');
  }

  Future<List<QuestionAnswerModelWithHive>> getQuesAnswer() async {
    if (_questionBox == null) {
      await openBox();
    }
    return _questionBox!.values.toList();
  }

  Future<void> closeBox() async {
    await _questionBox!.close();
  }

  Future<void> addQuestionAnswer(
      QuestionAnswerModelWithHive quesAnswerModelWithHive) async {
    if (_questionBox == null) {
      await openBox();
    }
    await _questionBox!.add(quesAnswerModelWithHive);
  }
}
