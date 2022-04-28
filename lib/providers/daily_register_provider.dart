import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/hive_boxes/boxes.dart';
import 'package:intl/intl.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/activity_options.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/daily_register.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/intake_options.dart';
import 'package:lifestyle_tracker/models/daily_edit_parameters/symptom.dart';

import 'edited_day_date_time_provider.dart';

final registerProvider = StateNotifierProvider<Register, DailyRegister>((ref) {
  final date = ref.watch(editedDayDateTimeProvider);
  final dayDate = DateFormat('yyyy-MM-dd').format(date);
  return Register(dayDate);
});

class Register extends StateNotifier<DailyRegister> {
  Register(String date)
      : super(DailyRegister(
          registerCreationDate: date,
          bodyWeight: 0,
          description: "Description",
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

    final register = box.get(currentDate);
    if (register != null) {
      state = register;
    }
  }

  void edit({
    String? registerCreationDate,
    String? description,
    double? sleepQuality,
    double? energyLevel,
    double? bodyWeight,
    double? mood,
    List<Symptom>? symptoms,
    List<Exercise>? exercise,
    List<Meditation>? meditation,
    List<Meal>? meals,
    List<Supplement>? supplements,
    List<Drink>? drinks,
    List<Snack>? snacks,
  }) {
    DailyRegister register = state;

    register = DailyRegister(
      registerCreationDate: registerCreationDate ?? state.registerCreationDate,
      bodyWeight: bodyWeight ?? state.bodyWeight,
      description: description ?? state.description,
      drinks: drinks ?? state.drinks,
      energyLevel: energyLevel ?? state.energyLevel,
      exercise: exercise ?? state.exercise,
      meals: meals ?? state.meals,
      meditation: meditation ?? state.meditation,
      mood: mood ?? state.mood,
      sleepQuality: sleepQuality ?? state.sleepQuality,
      snacks: snacks ?? state.snacks,
      supplements: supplements ?? state.supplements,
      symptoms: symptoms ?? state.symptoms,
    );
    print("Edited Register: $register");

    state = register;
  }

  Future<void> saveToDevice() async {
    String ymdDate = state.registerCreationDate!;

    final box = Boxes.getRegisters();
    box.put(ymdDate, state);
    print("Saving the info related to $ymdDate");
  }

  //TODO: allow deleting complete daily register.

  Future<void> deleteFromDevice(DateTime selectedDate) async {
    String ymdDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    final box = Boxes.getRegisters();
    if (box.containsKey(ymdDate)) {
      box.delete(ymdDate);
    }
    //state = emptyDailyRegister();//!
    print("deleted Register");
  }

  getSingleRegister(String parameter) => {
        "registerCreationDate": state.registerCreationDate,
        "bodyWeight": state.bodyWeight,
        "description": state.description,
        "drinks": state.drinks,
        "energyLevel": state.energyLevel,
        "exercise": state.exercise,
        "meals": state.meals,
        "meditation": state.meditation,
        "mood": state.mood,
        "sleepQuality": state.sleepQuality,
        "snacks": state.snacks,
        "supplements": state.supplements,
        "symptoms": state.symptoms,
      }[parameter];

  void updateSingleRegister() {}
}
