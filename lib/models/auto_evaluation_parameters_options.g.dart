// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_evaluation_parameters_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnergyLevelAdapter extends TypeAdapter<EnergyLevel> {
  @override
  final int typeId = 10;

  @override
  EnergyLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnergyLevel(
      fields[0] as DateTime,
      fields[1] as int,
    )
      ..title = fields[2] as String
      ..color = fields[3] as Color;
  }

  @override
  void write(BinaryWriter writer, EnergyLevel obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.color)
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
      other is EnergyLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SleepQualityAdapter extends TypeAdapter<SleepQuality> {
  @override
  final int typeId = 11;

  @override
  SleepQuality read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepQuality(
      fields[0] as DateTime,
      fields[1] as int,
    )
      ..title = fields[2] as String
      ..color = fields[3] as Color;
  }

  @override
  void write(BinaryWriter writer, SleepQuality obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.color)
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
      other is SleepQualityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoodLevelAdapter extends TypeAdapter<MoodLevel> {
  @override
  final int typeId = 12;

  @override
  MoodLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodLevel(
      fields[0] as DateTime,
      fields[1] as int,
    )
      ..title = fields[2] as String
      ..color = fields[3] as Color;
  }

  @override
  void write(BinaryWriter writer, MoodLevel obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.color)
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
      other is MoodLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
