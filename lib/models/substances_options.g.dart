// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substances_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 5;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
      fields[2] as DateTime,
      duration: fields[3] as int?,
    )
      ..title = fields[4] as String
      ..color = fields[5] as Color;
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.color)
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
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SupplementAdapter extends TypeAdapter<Supplement> {
  @override
  final int typeId = 6;

  @override
  Supplement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Supplement(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
      fields[2] as DateTime,
      duration: fields[3] as int?,
    )
      ..title = fields[4] as String
      ..color = fields[5] as Color;
  }

  @override
  void write(BinaryWriter writer, Supplement obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.color)
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
      other is SupplementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedicationAdapter extends TypeAdapter<Medication> {
  @override
  final int typeId = 7;

  @override
  Medication read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medication(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
      fields[2] as DateTime,
      duration: fields[3] as int?,
    )
      ..title = fields[4] as String
      ..color = fields[5] as Color;
  }

  @override
  void write(BinaryWriter writer, Medication obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.color)
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
      other is MedicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DrinkAdapter extends TypeAdapter<Drink> {
  @override
  final int typeId = 8;

  @override
  Drink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Drink(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
      fields[2] as DateTime,
      duration: fields[3] as int?,
    )
      ..title = fields[4] as String
      ..color = fields[5] as Color;
  }

  @override
  void write(BinaryWriter writer, Drink obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.color)
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
      other is DrinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SnackAdapter extends TypeAdapter<Snack> {
  @override
  final int typeId = 9;

  @override
  Snack read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Snack(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
      fields[2] as DateTime,
      duration: fields[3] as int?,
    )
      ..title = fields[4] as String
      ..color = fields[5] as Color;
  }

  @override
  void write(BinaryWriter writer, Snack obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.color)
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
      other is SnackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
