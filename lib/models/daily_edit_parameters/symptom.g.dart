// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SymptomAdapter extends TypeAdapter<Symptom> {
  @override
  final int typeId = 2;

  @override
  Symptom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Symptom(
      symptoms: (fields[0] as List?)?.cast<String>(),
      symptomAverageSeverity: fields[1] as double?,
      briefDescription: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Symptom obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.symptoms)
      ..writeByte(1)
      ..write(obj.symptomAverageSeverity)
      ..writeByte(2)
      ..write(obj.briefDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SymptomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
