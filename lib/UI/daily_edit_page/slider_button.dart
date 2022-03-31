import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderButton extends ConsumerStatefulWidget {
  const SliderButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends ConsumerState<SliderButton> {
  final double _min = 0;

  final double _max = 10;

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          // textAlign: TextAlign.start,
        ),
        SfSlider(
          labelPlacement: LabelPlacement.betweenTicks,
          // showTicks: true,
          // showLabels: true,
          enableTooltip: true,
          // shouldAlwaysShowTooltip: true,
          interval: 1,
          min: _min,
          max: _max,
          stepSize: 1,
          onChanged: (value) {
            setState(() {
              _value = value;
              final register = ref.read(registerProvider.notifier);
              _registerValue(register, widget.title, _value);
            });
          },
          value: _value,
        ),
      ],
    );
  }

  _registerValue(
    Register register,
    String title,
    double value,
  ) {
    int _value = value.toInt();
    if (title == "Sleep Quality") {
      register.edit(sleepQuality: _value);
    }
    if (title == "Energy Level") {
      register.edit(energyLevel: _value);
    }
    if (title == "Mood") {
      register.edit(mood: _value);
    }
  }
}
