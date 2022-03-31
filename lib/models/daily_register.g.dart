// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_register.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyRegisterAdapter extends TypeAdapter<DailyRegister> {
  @override
  final int typeId = 0;

  @override
  DailyRegister read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyRegister(
      registerCreationDate: fields[0] as String?,
      description: fields[1] as String?,
      sleepQuality: fields[2] as int?,
      energyLevel: fields[3] as int?,
      bodyWeight: fields[5] as double?,
      mood: fields[4] as int?,
      symptoms: (fields[6] as List?)?.cast<Symptom>(),
      exercise: (fields[7] as List?)?.cast<Exercise>(),
      meditation: (fields[8] as List?)?.cast<Meditation>(),
      meals: (fields[9] as List?)?.cast<Meal>(),
      supplements: (fields[10] as List?)?.cast<Supplement>(),
      drinks: (fields[12] as List?)?.cast<Drink>(),
      snacks: (fields[13] as List?)?.cast<Snack>(),
    )..medication = (fields[11] as List?)?.cast<Medication>();
  }

  @override
  void write(BinaryWriter writer, DailyRegister obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.registerCreationDate)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.sleepQuality)
      ..writeByte(3)
      ..write(obj.energyLevel)
      ..writeByte(4)
      ..write(obj.mood)
      ..writeByte(5)
      ..write(obj.bodyWeight)
      ..writeByte(6)
      ..write(obj.symptoms)
      ..writeByte(7)
      ..write(obj.exercise)
      ..writeByte(8)
      ..write(obj.meditation)
      ..writeByte(9)
      ..write(obj.meals)
      ..writeByte(10)
      ..write(obj.supplements)
      ..writeByte(11)
      ..write(obj.medication)
      ..writeByte(12)
      ..write(obj.drinks)
      ..writeByte(13)
      ..write(obj.snacks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyRegisterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      duration: fields[2] as int?,
      exerciseType: fields[3] as String?,
      exerciseQuality: fields[4] as int?,
      dateTime: fields[5] as DateTime?,
    )
      ..title = fields[0] as String
      ..color = fields[1] as Color;
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.exerciseType)
      ..writeByte(4)
      ..write(obj.exerciseQuality)
      ..writeByte(5)
      ..write(obj.dateTime);
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
      symptomAverageSeverity: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Symptom obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.symptoms)
      ..writeByte(1)
      ..write(obj.symptomAverageSeverity);
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
      duration: fields[2] as int?,
      meditationType: fields[3] as String?,
      meditationQuality: fields[4] as int?,
      dateTime: fields[5] as DateTime?,
    )
      ..title = fields[0] as String
      ..color = fields[1] as Color;
  }

  @override
  void write(BinaryWriter writer, Meditation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.meditationType)
      ..writeByte(4)
      ..write(obj.meditationQuality)
      ..writeByte(5)
      ..write(obj.dateTime);
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
