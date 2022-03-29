import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/hive_boxes/boxes.dart';
import 'package:lifestyle_tracker/models/daily_register.dart';
import 'package:intl/intl.dart';
import 'package:lifestyle_tracker/models/substances_options.dart';

class Register extends StateNotifier<DailyRegister> {
  Register(DailyRegister state)
      : super(DailyRegister(
          registerCreationDate: DateTime.now(),
          bodyWeight: 0,
          description: "",
          drinks: [],
          energyLevel: 0,
          exercise: [],
          meals: [],
          meditation: [],
          mood: 0,
          sleepQuality: 0,
          snacks: [],
          supplements: [],
          symptoms: [],
        )) {
    //fetch state from Hive
    final box = Boxes.getRegisters();

    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final myTransaction = box.get(currentDate);
  }

  Future<void> editRegister(
    DateTime registerCreationDate,
    String description,
    int sleepQuality,
    int energyLevel,
    double bodyWeight,
    int mood,
    List<Symptom> symptoms,
    List<Exercise> exercise,
    List<Meditation> meditation,
    List<Meal> meal,
    List<Supplement> supplements,
    List<Drink> drinks,
    List<Snack> snacks,
  ) async {
    //TODO: make dailyRegister fields nullable

    final register = DailyRegister(
      registerCreationDate: registerCreationDate,
      bodyWeight: bodyWeight,
      description: description,
      drinks: drinks,
      energyLevel: energyLevel,
      exercise: exercise,
      meals: meal,
      meditation: meditation,
      mood: mood,
      sleepQuality: sleepQuality,
      snacks: snacks,
      supplements: supplements,
      symptoms: symptoms,
    );
    String ymdDate = DateFormat('yyyy-MM-dd').format(registerCreationDate);
    print(ymdDate);

    state = register;

    final box = Boxes.getRegisters();
    box.put(ymdDate, register);
  }

  //TODO: allow deleting complete daily register.

  Future<void> deleteRegister(DateTime selectedDate) async {
    String ymdDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    final box = Boxes.getRegisters();
    if (box.containsKey(ymdDate)) {
      box.delete(ymdDate);
    }
  }
}
