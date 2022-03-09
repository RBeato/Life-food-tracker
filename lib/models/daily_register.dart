//overall quality is measured from 1 to 10 (integers only)

import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/models/substances_options.dart';

enum Symptomatology {
  legPain,
  chestPain,
  abdominalPain,
  diarrhea,
  obstipation,
  badVision,
  weakness,
  dizziness,
  brainFog,
  fatigue,
}

class DailyRegister {
  DateTime registerCreationDate;
  String? description;
  int? sleepQuality;
  int? energyLevel;
  int? mood;
  int? weight;
  List<Symptom>? symptoms;
  List<Exercise>? exercise;
  List<Meditation>? meditation;
  List<Meal>? meals;
  List<Supplement>? supplements;
  List<Medication>? medication;
  List<Drink>? drinks;
  List<Snack>? snacks; //or consider a meal?

  DailyRegister({
    required this.registerCreationDate,
    this.description,
    this.sleepQuality,
    this.energyLevel,
    this.weight,
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
      "weight": weight,
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
      weight: $weight,
      mood: $mood,
      symptoms: $symptoms,
      exercise: $exercise,
      meditation: $meditation,
      meals: $meals,
      supplements: $supplements,
      drinks: $drinks,
      snacks: $snacks """;
  }
}

class Exercise {
  String title = "Workout";
  Color color = Colors.blue;
  int? duration;
  String? exerciseType; //TODO:Create enum
  int? exerciseQuality; //TODO:Create enum
  DateTime? dateTime;

  Exercise({
    this.duration,
    this.exerciseType,
    this.exerciseQuality,
    this.dateTime,
  });
}

class Symptom {
  List<Symptomatology>? symptoms;
  int? symptomAverageSeverity;
  Symptom({
    this.symptoms,
    this.symptomAverageSeverity,
  });
}

class Meditation {
  String title = "Meditation";
  Color color = Colors.purple;
  int? duration;
  String? meditationType; //TODO:Create enum
  int? meditationQuality; //TODO:Create enum
  DateTime? dateTime;

  Meditation({
    this.duration,
    this.meditationType,
    this.meditationQuality,
    this.dateTime,
  });
}
