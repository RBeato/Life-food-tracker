import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/activity.dart';

part 'activity_options.g.dart';

@HiveType(typeId: 1)
class Exercise extends Activity {
  Exercise({
    required DateTime dateTime,
    required int duration,
    required String type,
    required double quality,
    String? title,
    String? briefDescription,
  }) : super(
            title: "Workout",
            briefDescription: "Brief description",
            dateTime: dateTime,
            duration: duration,
            type: type,
            quality: quality);

  @HiveField(6)
  Color color = Colors.blue;
}

@HiveType(typeId: 3)
class Meditation extends Activity {
  Meditation({
    required DateTime dateTime,
    required int duration,
    required String type,
    required double quality,
    String? title,
    String? briefDescription,
  }) : super(
            title: "Meditation",
            briefDescription: "Brief description",
            dateTime: dateTime,
            duration: duration,
            type: type,
            quality: quality);

  @HiveField(6)
  Color color = Colors.purple;
}
