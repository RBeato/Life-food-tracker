import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants.dart';

final showExercisePanelProvider = StateProvider<bool>((ref) => false);

class ExerciseOptions extends ConsumerWidget {
  const ExerciseOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showExercisePanel = ref.watch(showExercisePanelProvider);

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [Text("Exercise: ")],
        ),
        IconButton(
          onPressed: () {
            ref.read(showExercisePanelProvider.notifier).state =
                !showExercisePanel;
            // //TODO: Close all other opened panels
          },
          icon: Icon(
            showExercisePanel ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: Colors.blue,
            size: 16.0,
          ),
        ),
      ]),
      showExercisePanel ? ExercisePanel() : Container(),
    ]);
  }
}

class ExercisePanel extends StatelessWidget {
  const ExercisePanel({Key? key}) : super(key: key);

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
            ExerciseType(),
            CustomTimePicker(twoTimePickers: true),
            ExerciseQuality(),
          ],
        ),
      ),
    );
  }
}

class ExerciseType extends StatelessWidget {
  ExerciseType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children:
            [...Constants.aerobicExercises, ...Constants.anaerobicExercises]
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
                .toList());
  }
}

class ExerciseQuality extends StatefulWidget {
  const ExerciseQuality({Key? key}) : super(key: key);

  @override
  State<ExerciseQuality> createState() => _ExerciseQualityState();
}

class _ExerciseQualityState extends State<ExerciseQuality> {
  final double _min = 0;
  final double _max = 10;
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Quality"),
        SfSlider(
          labelPlacement: LabelPlacement.betweenTicks,
          enableTooltip: true,
          interval: 1,
          min: _min,
          max: _max,
          stepSize: 1,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        ),
      ],
    );
  }
}
