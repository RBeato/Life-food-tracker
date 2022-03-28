import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderButton extends StatefulWidget {
  const SliderButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
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
            });
          },
          value: _value,
        ),
      ],
    );
  }
}
