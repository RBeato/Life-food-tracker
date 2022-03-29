import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_tracker/models/auto_evaluation_parameters.dart';

part 'auto_evaluation_parameters_options.g.dart';

@HiveType(typeId: 10)
class EnergyLevel extends AutoEvaluationParameter {
  EnergyLevel(DateTime date, int value) : super(date: date, value: value);

  @HiveField(2) //'AutoEvaluationParameter' already defined'@HiveField(0-1)'
  String title = "Energy";

  @HiveField(3)
  Color color = Colors.orange;

  @override
  String toString() {
    return """
title: $title,
  date: $date,
  value: $value,
  color: $color
""";
  }
}

@HiveType(typeId: 11)
class SleepQuality extends AutoEvaluationParameter {
  SleepQuality(DateTime date, int value) : super(date: date, value: value);

  @HiveField(2)
  String title = "Sleep";

  @HiveField(3)
  Color color = Colors.green;

  @override
  String toString() {
    return """
title: $title,
  date: $date,
  value: $value,
  color: $color
""";
  }
}

@HiveType(typeId: 12)
class MoodLevel extends AutoEvaluationParameter {
  MoodLevel(DateTime date, int value) : super(date: date, value: value);

  @HiveField(2)
  String title = "Mood";

  @HiveField(3)
  Color color = Colors.purple;

  @override
  String toString() {
    return """
title: $title,
  date: $date,
  value: $value,
  color: $color
""";
  }
}
