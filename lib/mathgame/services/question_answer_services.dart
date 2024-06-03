import 'package:hive_flutter/adapters.dart';
import 'package:kids_math_play/mathgame/controller.dart';

class QuestionAnswerServices {
  Box<QuestionAnswerModel>? _box;

  Future<void> openBox() async {
    _box = await Hive.openBox<QuestionAnswerModel>('questionanswer');
  }

  Future<void> closeBox() async {
    await _box!.close();
  }

  Future<void> addData(QuestionAnswerModel questionAnswerModel) async {
    if (_box == null) {
      await openBox();
    }
    await _box!.add(questionAnswerModel);
  }

  Future<List<QuestionAnswerModel>> getData() async {
    if (_box == null) {
      await openBox();
    }
    return _box!.values.toList();
  }
}
