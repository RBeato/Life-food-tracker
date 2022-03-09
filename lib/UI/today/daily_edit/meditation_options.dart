import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants.dart';

final showMeditationPanelProvider = StateProvider<bool>((ref) => false);

class MeditationOptions extends ConsumerWidget {
  const MeditationOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showExercisePanel = ref.watch(showMeditationPanelProvider);

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [Text("Meditation: ")],
        ),
        IconButton(
          onPressed: () {
            ref.read(showMeditationPanelProvider.notifier).state =
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
      showExercisePanel ? MeditationPanel() : Container(),
    ]);
  }
}

class MeditationPanel extends StatelessWidget {
  const MeditationPanel({Key? key}) : super(key: key);

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
            MeditationType(),
            Text(
              "Choose 2 max.",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            CustomTimePicker(),
            MeditationQuality(),
          ],
        ),
      ),
    );
  }
}

class MeditationType extends StatelessWidget {
  MeditationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        children: Constants.typesOfMeditation
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

class MeditationQuality extends StatefulWidget {
  const MeditationQuality({Key? key}) : super(key: key);

  @override
  State<MeditationQuality> createState() => _MeditationQualityState();
}

class _MeditationQualityState extends State<MeditationQuality> {
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
