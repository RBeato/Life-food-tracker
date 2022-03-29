// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubstanceAdapter extends TypeAdapter<Substance> {
  @override
  final int typeId = 4;

  @override
  Substance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Substance(
      name: fields[0] as String,
      ingredients: (fields[1] as List).cast<String>(),
      dateTime: fields[2] as DateTime,
      duration: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Substance obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ingredients)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
