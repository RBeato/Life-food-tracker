import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'formulary.dart';
import 'list_of_symptoms.dart';

class SymptomsPanel extends ConsumerWidget {
  const SymptomsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showSymptomsPanel = ref.watch(showSymptomsPanelProvider);
    List<String> symptomsList = ref.watch(symptomsListProvider);
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Symptoms: "),
            Wrap(
                children: symptomsList
                    .map(
                      (item) => Text(item.toString()),
                    )
                    .toList()),
          ],
        ),
        IconButton(
          onPressed: () {
            ref.read(showSymptomsPanelProvider.notifier).state =
                !showSymptomsPanel;
            //TODO: Close all other opened panels
          },
          icon: Icon(
              showSymptomsPanel ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.blue,
              size: 16.0),
        ),
      ]),
      showSymptomsPanel
          ? Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(children: [ListOfSymptoms(), SymptomSeverety()]))
          : Container(),
    ]);
  }
}

class SymptomSeverety extends StatefulWidget {
  const SymptomSeverety({Key? key}) : super(key: key);

  @override
  State<SymptomSeverety> createState() => _SymptomSeveretyState();
}

class _SymptomSeveretyState extends State<SymptomSeverety> {
  final double _min = 0;
  final double _max = 10;
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Intensity"),
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
