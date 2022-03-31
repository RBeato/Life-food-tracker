import 'package:flutter/material.dart';

import 'auto_eval_params_chart.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
                "Days you stick to the diet, show in calendar with some sort of icon or mark!"),
            Text("Weight variation chart!"),
            AutoEvalParamsChart(),
            Text(
                "Ai correlation go plot possible causes of symptoms, mood, sleep quality, and"),
            Text("Show diet type change date"),
          ],
        ),
      ),
    );
  }
}
