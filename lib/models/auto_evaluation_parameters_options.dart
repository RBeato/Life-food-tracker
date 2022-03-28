import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/models/auto_evaluation_parameters.dart';

class EnergyLevel extends AutoEvaluationParameter {
  EnergyLevel(DateTime date, int value) : super(date: date, value: value);

  String title = "Energy";
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

class SleepQuality extends AutoEvaluationParameter {
  SleepQuality(DateTime date, int value) : super(date: date, value: value);

  String title = "Sleep";
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

class MoodLevel extends AutoEvaluationParameter {
  MoodLevel(DateTime date, int value) : super(date: date, value: value);

  String title = "Mood";
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
