import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class QualitySlider extends StatefulWidget {
  const QualitySlider(this.parameter, {Key? key}) : super(key: key);

  final String parameter;

  @override
  State<QualitySlider> createState() => _QualitySliderState();
}

class _QualitySliderState extends State<QualitySlider> {
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
