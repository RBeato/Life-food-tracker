import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/models/substance.dart';

class Meal extends Substance {
  Meal(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  String title = "Meal";
  Color color = Colors.green;
}

class Supplement extends Substance {
  Supplement(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  String title = "Supplement";
  Color color = Colors.pink;
}

class Medication extends Substance {
  Medication(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  String title = "Medication";
  Color color = Colors.grey;
}

class Drink extends Substance {
  Drink(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  String title = "Drink";
  Color color = Colors.blue;
}

class Snack extends Substance {
  Snack(String name, List<String> ingredients, DateTime dateTime,
      {int? duration})
      : super(
          name: name,
          ingredients: ingredients,
          dateTime: dateTime,
          duration: duration = 30,
        );

  String title = "Snack";
  Color color = Colors.brown;
}
