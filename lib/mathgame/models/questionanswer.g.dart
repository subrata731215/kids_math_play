// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionanswer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAnswerAdapter extends TypeAdapter<QuestionAnswer> {
  @override
  final int typeId = 0;

  @override
  QuestionAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionAnswer(
      firstNoo: fields[0] as int,
      mathSign: fields[1] as String,
      secondNoo: fields[2] as int,
      answer: fields[3] as String,
      icon: fields[4] as Icon,
      tileColor: fields[5] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionAnswer obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstNoo)
      ..writeByte(1)
      ..write(obj.mathSign)
      ..writeByte(2)
      ..write(obj.secondNoo)
      ..writeByte(3)
      ..write(obj.answer)
      ..writeByte(4)
      ..write(obj.icon)
      ..writeByte(5)
      ..write(obj.tileColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
