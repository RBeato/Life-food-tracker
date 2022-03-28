import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/constants.dart';

import 'slider_button.dart';

class AutoEvalQuantifiedParams extends StatelessWidget {
  const AutoEvalQuantifiedParams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: Constants.autoEvaluationQuantifiedParameters
            .map((item) =>
                SliderButton(title: Constants.dailyRegisterToUIString[item]!))
            .toList());
  }
}
