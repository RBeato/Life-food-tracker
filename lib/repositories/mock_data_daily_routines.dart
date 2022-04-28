import 'package:intl/intl.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/activity_options.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/daily_register.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/intake_options.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/symptom.dart';

import '../constants.dart';

List<DailyRegister> mockRegisters = [
  DailyRegister(
    registerCreationDate: DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 3))),
    description: "It has been a fantastic day",
    sleepQuality: 8,
    energyLevel: 9,
    mood: 9,
    symptoms: [
      Symptom(
        symptoms: [Constants.symptoms[0]],
        symptomAverageSeverity: 5,
      ),
    ],
    exercise: [
      Exercise(
        duration: 30,
        type: "running",
        quality: 8,
        dateTime: DateTime.now()
            .subtract(const Duration(days: 3))
            .add(const Duration(hours: 1))
            .add(const Duration(minutes: 20)),
      ),
    ],
    meditation: [
      Meditation(
        duration: 30,
        type: "breathing",
        quality: 7,
        dateTime: DateTime.now()
            .subtract(const Duration(days: 3))
            .add(const Duration(hours: 3))
            .add(const Duration(minutes: 44)),
      ),
    ],
    supplements: [
      Supplement(
          "Vitamin C",
          ["Vitamin C"],
          DateTime.now()
              .subtract(const Duration(days: 3))
              .add(const Duration(hours: 5)))
    ],
    meals: [
      Meal(
          "Potatoes thing",
          ["potatoes", "cabbage"],
          DateTime.now()
              .subtract(const Duration(days: 3))
              .subtract(const Duration(hours: 2)),
          duration: 45),
      Meal(
          "Carrots and cabbage",
          ["carrot", "cabbage"],
          DateTime.now()
              .subtract(const Duration(days: 3))
              .add(const Duration(hours: 2)))
    ],
    drinks: [
      Drink(
          "water",
          ["water"],
          DateTime.now()
              .subtract(const Duration(days: 3))
              .add(const Duration(hours: 4)))
    ],
    snacks: [
      Snack(
          "Apple",
          ["apple"],
          DateTime.now()
              .subtract(const Duration(days: 3))
              .add(const Duration(hours: 2)))
    ],
  ),
  DailyRegister(
    registerCreationDate: DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 2))),
    description: "It has been a fantastic day",
    sleepQuality: null,
    energyLevel: null,
    mood: null,
    symptoms: [
      Symptom(
        symptoms: [Constants.symptoms[0]],
        symptomAverageSeverity: 5,
      ),
    ],
    exercise: [
      Exercise(
        duration: 30,
        type: "running",
        quality: 8,
        dateTime: DateTime.now()
            .subtract(const Duration(days: 2))
            .add(const Duration(hours: 1))
            .add(const Duration(minutes: 20)),
      ),
    ],
    meditation: [
      Meditation(
        duration: 30,
        type: "breathing",
        quality: 7,
        dateTime: DateTime.now()
            .subtract(const Duration(days: 2))
            .add(const Duration(hours: 3))
            .add(const Duration(minutes: 44)),
      ),
    ],
    supplements: [
      Supplement(
          "Vitamin C",
          ["Vitamin C"],
          DateTime.now()
              .subtract(const Duration(days: 2))
              .add(const Duration(hours: 5)))
    ],
    meals: [
      Meal(
          "Potatoes thing",
          ["potatoes", "cabbage"],
          DateTime.now()
              .subtract(const Duration(days: 2))
              .subtract(const Duration(hours: 2)),
          duration: 45),
      Meal(
          "Carrots and cabbage",
          ["carrot", "cabbage"],
          DateTime.now()
              .subtract(const Duration(days: 2))
              .add(const Duration(hours: 2)))
    ],
    drinks: [
      Drink(
          "water",
          ["water"],
          DateTime.now()
              .subtract(const Duration(days: 2))
              .add(const Duration(hours: 4)))
    ],
    snacks: [
      Snack(
          "Apple",
          ["apple"],
          DateTime.now()
              .subtract(const Duration(days: 2))
              .add(const Duration(hours: 2)))
    ],
  ),
  DailyRegister(
    registerCreationDate: DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1))),
    description: "It has been a fantastic day",
    sleepQuality: 9,
    energyLevel: 6,
    mood: 7,
    symptoms: [
      Symptom(
        symptoms: [Constants.symptoms[0]],
        symptomAverageSeverity: 5,
      ),
    ],
    exercise: [
      Exercise(
        duration: 30,
        type: "running",
        quality: 8,
        dateTime: DateTime.now()
            .subtract(const Duration(days: 1))
            .add(const Duration(hours: 1))
            .add(const Duration(minutes: 20)),
      ),
    ],
    meditation: [
      Meditation(
        duration: 30,
        type: "breathing",
        quality: 7,
        dateTime: DateTime.now()
            .subtract(const Duration(days: 1))
            .add(const Duration(hours: 3))
            .add(const Duration(minutes: 44)),
      ),
    ],
    supplements: [
      Supplement(
          "Vitamin C",
          ["Vitamin C"],
          DateTime.now()
              .subtract(const Duration(days: 1))
              .add(const Duration(hours: 5)))
    ],
    meals: [
      Meal(
          "Potatoes thing",
          ["potatoes", "cabbage"],
          DateTime.now()
              .subtract(const Duration(days: 1))
              .subtract(const Duration(hours: 2)),
          duration: 45),
      Meal(
          "Carrots and cabbage",
          ["carrot", "cabbage"],
          DateTime.now()
              .subtract(const Duration(days: 1))
              .add(const Duration(hours: 2)))
    ],
    drinks: [
      Drink(
          "water",
          ["water"],
          DateTime.now()
              .subtract(const Duration(days: 1))
              .add(const Duration(hours: 4)))
    ],
    snacks: [
      Snack(
          "Apple",
          ["apple"],
          DateTime.now()
              .subtract(const Duration(days: 1))
              .add(const Duration(hours: 2)))
    ],
  ),
  DailyRegister(
    registerCreationDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    description: "It has been a fantastic day It has been a fantastic day",
    sleepQuality: 8,
    energyLevel: 7,
    mood: 8,
    symptoms: [
      Symptom(
        symptoms: [Constants.symptoms[0]],
        symptomAverageSeverity: 5,
      ),
    ],
    exercise: [
      Exercise(
        duration: 30,
        type: "running",
        quality: 8,
        dateTime: DateTime.now()
            .add(const Duration(hours: 2))
            .add(const Duration(minutes: 34)),
      ),
    ],
    meditation: [
      Meditation(
        duration: 30,
        type: "breathing",
        quality: 7,
        dateTime: DateTime.now()
            .add(const Duration(hours: 2))
            .add(const Duration(minutes: 34)),
      ),
    ],
    supplements: [
      Supplement("Vitamin C", ["Vitamin C"],
          DateTime.now().add(const Duration(hours: 5)))
    ],
    meals: [
      Meal("Potatoes thing", ["potatoes", "cabbage"],
          DateTime.now().subtract(const Duration(hours: 2)),
          duration: 45),
      Meal("Carrots and cabbage", ["carrot", "cabbage"],
          DateTime.now().add(const Duration(hours: 2)))
    ],
    drinks: [
      Drink("water", ["water"], DateTime.now().add(const Duration(hours: 4)))
    ],
    snacks: [
      Snack("Apple", ["apple"], DateTime.now().add(const Duration(hours: 2)))
    ],
  ),
];
