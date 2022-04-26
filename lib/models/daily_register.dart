//overall quality is measured from 1 to 10 (integers only)

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_tracker/models/substances_options.dart';

part 'daily_register.g.dart';

@HiveType(typeId: 0)
class DailyRegister extends HiveObject {
  @HiveField(0)
  String? registerCreationDate;

  @HiveField(1)
  String? description;

  @HiveField(2)
  double? sleepQuality;

  @HiveField(3)
  double? energyLevel;

  @HiveField(4)
  double? mood;

  @HiveField(5)
  double? bodyWeight;

  @HiveField(6)
  List<Symptom>? symptoms;

  @HiveField(7)
  List<Exercise>? exercise;

  @HiveField(8)
  List<Meditation>? meditation;

  @HiveField(9)
  List<Meal>? meals;

  @HiveField(10)
  List<Supplement>? supplements;

  @HiveField(11)
  List<Medication>? medication;

  @HiveField(12)
  List<Drink>? drinks;

  @HiveField(13)
  List<Snack>? snacks; //or consider a meal?

  DailyRegister({
    this.registerCreationDate,
    this.description,
    this.sleepQuality,
    this.energyLevel,
    this.bodyWeight,
    this.mood,
    this.symptoms,
    this.exercise,
    this.meditation,
    this.meals,
    this.supplements,
    this.drinks,
    this.snacks,
  });

  Map<String, dynamic> toJson() {
    return {
      "registerCreationDate": registerCreationDate,
      "description": description,
      "sleepQuality": sleepQuality,
      "energyLevel": energyLevel,
      "weight": bodyWeight,
      "mood": mood,
      "symptoms": symptoms,
      "exercise": exercise,
      "meditation": meditation,
      "meals": meals,
      "supplements": supplements,
      "drinks": drinks,
      "snacks": snacks,
    };
  }

  @override
  String toString() {
    return """
      Daily Register\n
      registerCreationDate: $registerCreationDate,
      description: $description,
      sleepQuality: $sleepQuality,
      energyLevel: $energyLevel,
      weight: $bodyWeight,
      mood: $mood,
      symptoms: $symptoms,
      exercise: $exercise,
      meditation: $meditation,
      meals: $meals,
      supplements: $supplements,
      drinks: $drinks,
      snacks: $snacks,
       """;
  }
}

@HiveType(typeId: 1)
class Exercise {
  @HiveField(0)
  String title = "Workout";

  @HiveField(1)
  Color color = Colors.blue;

  @HiveField(2)
  int? duration;

  @HiveField(3)
  String? exerciseType; //TODO:Create enum

  @HiveField(4)
  double? exerciseQuality; //TODO:Create enum

  @HiveField(5)
  DateTime? dateTime;

  Exercise({
    this.duration,
    this.exerciseType,
    this.exerciseQuality,
    this.dateTime,
  });
}

@HiveType(typeId: 2)
class Symptom {
  @HiveField(0)
  List<String>? symptoms;

  @HiveField(1)
  double? symptomAverageSeverity;

  Symptom({
    this.symptoms,
    this.symptomAverageSeverity,
  });
}

@HiveType(typeId: 3)
class Meditation {
  @HiveField(0)
  String title = "Meditation";

  @HiveField(1)
  Color color = Colors.purple;

  @HiveField(2)
  int? duration;

  @HiveField(3)
  String? meditationType; //TODO:Create enum

  @HiveField(4)
  double? meditationQuality; //TODO:Create enum

  @HiveField(5)
  DateTime? dateTime;

  Meditation({
    this.duration,
    this.meditationType,
    this.meditationQuality,
    this.dateTime,
  });
}
