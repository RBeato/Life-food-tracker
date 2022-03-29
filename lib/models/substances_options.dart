import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'substance.dart';

part 'substances_options.g.dart';

@HiveType(typeId: 5)
class Meal extends Substance {
  Meal(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  @HiveField(4) //field '4' because Substance already assigned 0 - 3'
  String title = "Meal";

  @HiveField(5)
  Color color = Colors.green;
}

@HiveType(typeId: 6)
class Supplement extends Substance {
  Supplement(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  @HiveField(4)
  String title = "Supplement";

  @HiveField(5)
  Color color = Colors.pink;
}

@HiveType(typeId: 7)
class Medication extends Substance {
  Medication(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  @HiveField(4)
  String title = "Medication";

  @HiveField(5)
  Color color = Colors.grey;
}

@HiveType(typeId: 8)
class Drink extends Substance {
  Drink(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  @HiveField(4)
  String title = "Drink";

  @HiveField(5)
  Color color = Colors.blue;
}

@HiveType(typeId: 9)
class Snack extends Substance {
  Snack(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  @HiveField(4)
  String title = "Snack";

  @HiveField(5)
  Color color = Colors.brown;
}
