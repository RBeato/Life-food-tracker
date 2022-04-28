// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_evaluation_parameters.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AutoEvaluationParameterAdapter
    extends TypeAdapter<AutoEvaluationParameter> {
  @override
  final int typeId = 11;

  @override
  AutoEvaluationParameter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AutoEvaluationParameter(
      sleep: fields[0] as double?,
      mood: fields[1] as double?,
      energy: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, AutoEvaluationParameter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.sleep)
      ..writeByte(1)
      ..write(obj.mood)
      ..writeByte(2)
      ..write(obj.energy);
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
