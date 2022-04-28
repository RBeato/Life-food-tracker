import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'intake.dart';

part 'intake_options.g.dart';

@HiveType(typeId: 5)
class Meal extends Intake {
  Meal(
    String name,
    List<String> ingredients,
    DateTime dateTime, {
    int? duration,
    String? briefDescription,
  }) : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
          briefDescription: "Add more info",
        );

  @HiveField(5) //field '4' because Substance already assigned 0 - 3'
  String title = "Meal";

  @HiveField(6)
  Color color = Colors.green;
}

@HiveType(typeId: 6)
class Supplement extends Intake {
  Supplement(
    String name,
    List<String> ingredients,
    DateTime dateTime, {
    int? duration,
    String? briefDescription,
  }) : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
          briefDescription: "",
        );

  @HiveField(5)
  String title = "Supplement";

  @HiveField(6)
  Color color = Colors.pink;
}

@HiveType(typeId: 7)
class Medication extends Intake {
  Medication(
    String name,
    List<String> ingredients,
    DateTime dateTime, {
    int? duration,
    String? briefDescription,
  }) : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
          briefDescription: "",
        );

  @HiveField(5)
  String title = "Medication";

  @HiveField(6)
  Color color = Colors.grey;
}

@HiveType(typeId: 8)
class Drink extends Intake {
  Drink(
    String name,
    List<String> ingredients,
    DateTime dateTime, {
    int? duration,
    String? briefDescription,
  }) : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
          briefDescription: "More info!",
        );

  @HiveField(5)
  String title = "Drink";

  @HiveField(6)
  Color color = Colors.blue;
}

@HiveType(typeId: 9)
class Snack extends Intake {
  Snack(
    String name,
    List<String> ingredients,
    DateTime dateTime, {
    int? duration,
    String? briefDescription,
  }) : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
          briefDescription: "More info!",
        );

  @HiveField(5)
  String title = "Snack";

  @HiveField(6)
  Color color = Colors.brown;
}
