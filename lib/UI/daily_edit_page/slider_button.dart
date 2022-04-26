import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../constants.dart';

class SliderButton extends ConsumerStatefulWidget {
  SliderButton(this.item, {Key? key}) : super(key: key);

  String item;

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends ConsumerState<SliderButton> {
  final double _min = 0;
  final double _max = 10;
  double? _value;

  @override
  Widget build(BuildContext context) {
    _value =
        ref.watch(registerProvider.notifier).getSingleRegister(widget.item) ??
            0.0;
    String title = Constants.dailyRegisterToUIString[widget.item]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // textAlign: TextAlign.start,
        ),
        SfSlider(
          value: _value ?? 0.0,
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
            setState(() {
              _value = value;
            });
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
