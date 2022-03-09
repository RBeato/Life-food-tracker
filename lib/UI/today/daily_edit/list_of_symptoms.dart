import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/models/daily_register.dart';
import 'package:enum_to_string/enum_to_string.dart';

final symptomsListProvider = StateProvider<List<String>>((ref) => []);

class ListOfSymptoms extends ConsumerWidget {
  ListOfSymptoms({Key? key}) : super(key: key);

  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(symptomsListProvider);
    return Wrap(
      children: Symptomatology.values
          .toList()
          .map((symptom) => GestureDetector(
              onTap: () {
                if (selectedItems
                    .contains(EnumToString.convertToString(symptom))) {
                  selectedItems.removeWhere((element) =>
                      element == EnumToString.convertToString(symptom));
                } else {
                  selectedItems.add(EnumToString.convertToString(symptom));
                }
                ref.read(symptomsListProvider.notifier).state = selectedItems;
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: selectedItems
                              .contains(EnumToString.convertToString(symptom))
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        EnumToString.convertToString(symptom),
                        style: TextStyle(
                            color: selectedItems.contains(
                                    EnumToString.convertToString(symptom))
                                ? Colors.white
                                : Colors.blue),
                      ),
                    )),
              )))
          .toList(),
    );
  }
}
