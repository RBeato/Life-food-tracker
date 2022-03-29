// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_evaluation_parameters.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AutoEvaluationParameterAdapter
    extends TypeAdapter<AutoEvaluationParameter> {
  @override
  final int typeId = 9;

  @override
  AutoEvaluationParameter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AutoEvaluationParameter(
      date: fields[0] as DateTime,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AutoEvaluationParameter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutoEvaluationParameterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
