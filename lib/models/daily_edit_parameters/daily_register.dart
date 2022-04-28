import 'package:hive/hive.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/symptom.dart';

import 'activity_options.dart';
import 'intake_options.dart';

part 'daily_register.g.dart';

@HiveType(typeId: 10)
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
