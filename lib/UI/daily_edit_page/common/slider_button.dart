import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants.dart';

final sliderValueProvider =
    StateProvider.family<double?, Object>((ref, item) => {
          Constants.autoEvaluationQuantifiedParameters[0]: 0.0,
          Constants.autoEvaluationQuantifiedParameters[1]: 0.0,
          Constants.autoEvaluationQuantifiedParameters[2]: 0.0,
        }[item]);

class SliderButton extends ConsumerStatefulWidget {
  const SliderButton(this.item, {Key? key}) : super(key: key);

  final String item;

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends ConsumerState<SliderButton> {
  final double _min = 0;
  final double _max = 10;

  @override
  Widget build(BuildContext context) {
    final _value = ref.watch(sliderValueProvider(widget.item));

    String title = Constants.dailyRegisterToUIString[widget.item]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        SfSlider(
          value: _value,
          labelPlacement: LabelPlacement.betweenTicks,
          enableTooltip: true,
          interval: 1,
          min: _min,
          max: _max,
          stepSize: 1,
          onChangeEnd: (value) {
            final register = ref.read(registerProvider.notifier);
            _registerValue(register, title, _value!);
          },
          onChanged: (value) {
            ref.read(sliderValueProvider(widget.item).notifier).state = value;
          },
        ),
      ],
    );
  }

  _registerValue(
    Register register,
    String title,
    double value,
  ) {
    if (title == "Sleep Quality") {
      register.edit(sleepQuality: value);
    }
    if (title == "Energy Level") {
      register.edit(energyLevel: value);
    }
    if (title == "Mood") {
      register.edit(mood: value);
    }
  }
}
