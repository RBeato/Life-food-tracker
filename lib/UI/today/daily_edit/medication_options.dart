import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker.dart';

import '../../../constants.dart';
import 'daily_edit_pop_up_REMOVE.dart';

final showMedicationPanelProvider = StateProvider<bool>((ref) => false);

class MedicationOptions extends ConsumerWidget {
  const MedicationOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showMedicationPanel = ref.watch(showMedicationPanelProvider);

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [Text("Medication: ")],
        ),
        IconButton(
          onPressed: () {
            ref.read(showMedicationPanelProvider.notifier).state =
                !showMedicationPanel;
            // //TODO: Close all other opened panels
          },
          icon: Icon(
            showMedicationPanel ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: Colors.blue,
            size: 16.0,
          ),
        ),
      ]),
      showMedicationPanel ? MedicationPanel() : Container(),
    ]);
  }
}

class MedicationPanel extends StatelessWidget {
  const MedicationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            const MeditationType(),
            CustomTimePicker(
              twoTimePickers: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MeditationType extends StatelessWidget {
  const MeditationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ...Constants.typesOfMedicaments
              .map((element) => GestureDetector(
                  onTap: () {
                    // if (selectedItems
                    //     .contains(EnumToString.convertToString(symptom))) {
                    //   selectedItems.removeWhere((element) =>
                    //       element == EnumToString.convertToString(symptom));
                    // } else {
                    //   selectedItems.add(EnumToString.convertToString(symptom));
                    // }
                    // ref.read(symptomsListProvider.notifier).state = selectedItems;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          // color: selectedItems
                          //         .contains(EnumToString.convertToString(symptom))
                          //     ? Colors.blue
                          //     : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(element
                              // EnumToString.convertToString(symptom),
                              // style: TextStyle(
                              //     color: selectedItems.contains(
                              //             EnumToString.convertToString(symptom))
                              //         ? Colors.white
                              //         : Colors.blue),
                              ),
                        )),
                  )))
              .toList(),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DailyEditPopUp();
                  });
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
              size: 16.0,
            ),
          ),
        ]);
  }
}
