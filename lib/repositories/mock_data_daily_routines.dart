import 'package:lifestyle_tracker/models/daily_register.dart';
import 'package:lifestyle_tracker/models/substances_options.dart';

List<DailyRegister> mockRegisters = [
  DailyRegister(
    registerCreationDate: DateTime.now(),
    description: "It has been a fantastic day",
    sleepQuality: 8,
    energyLevel: 7,
    mood: 8,
    symptoms: [
      Symptom(
        symptoms: [Symptomatology.brainFog],
        symptomAverageSeverity: 5,
      ),
    ],
    exercise: [
      Exercise(
        duration: 30,
        exerciseType: "running",
        exerciseQuality: 8,
        dateTime: DateTime.now()
            .add(const Duration(hours: 2))
            .add(const Duration(minutes: 34)),
      ),
    ],
    meditation: [
      Meditation(
        duration: 30,
        meditationType: "breathing",
        meditationQuality: 7,
        dateTime: DateTime.now()
            .add(const Duration(hours: 2))
            .add(const Duration(minutes: 34)),
      ),
    ],
    meals: [
      Meal("Potatoes thing", ["potatoes", "cabbage"],
          DateTime.now().subtract(const Duration(hours: 2)),
          duration: 45),
      Meal("Carrots and cabbage", ["carrot", "cabbage"],
          DateTime.now().add(const Duration(hours: 2)))
    ],
    supplements: [
      Supplement("Vitamin C", ["Vitamin C"],
          DateTime.now().add(const Duration(hours: 5)))
    ],
    drinks: [
      Drink("water", ["water"], DateTime.now().add(const Duration(hours: 4)))
    ],
    snacks: [
      Snack("Apple", ["apple"], DateTime.now().add(const Duration(hours: 2)))
    ],
  ),
];
