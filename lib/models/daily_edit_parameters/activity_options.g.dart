// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 1;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      dateTime: fields[2] as DateTime,
      duration: fields[3] as int,
      type: fields[4] as String,
      quality: fields[5] as double,
      title: fields[0] as String?,
      briefDescription: fields[1] as String?,
    )..color = fields[6] as Color;
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(7)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.briefDescription)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.quality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeditationAdapter extends TypeAdapter<Meditation> {
  @override
  final int typeId = 3;

  @override
  Meditation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meditation(
      dateTime: fields[2] as DateTime,
      duration: fields[3] as int,
      type: fields[4] as String,
      quality: fields[5] as double,
      title: fields[0] as String?,
      briefDescription: fields[1] as String?,
    )..color = fields[6] as Color;
  }

  @override
  void write(BinaryWriter writer, Meditation obj) {
    writer
      ..writeByte(7)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.briefDescription)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.quality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeditationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
