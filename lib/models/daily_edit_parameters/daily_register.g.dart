// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_register.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyRegisterAdapter extends TypeAdapter<DailyRegister> {
  @override
  final int typeId = 10;

  @override
  DailyRegister read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyRegister(
      registerCreationDate: fields[0] as String?,
      description: fields[1] as String?,
      sleepQuality: fields[2] as double?,
      energyLevel: fields[3] as double?,
      bodyWeight: fields[5] as double?,
      mood: fields[4] as double?,
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
