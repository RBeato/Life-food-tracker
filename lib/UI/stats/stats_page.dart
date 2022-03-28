import 'package:flutter/material.dart';

import 'energy_chart.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
                "Days you stick to the diet, show in calendar with some sort of icon or mark!"),
            EnergyChart(),
            Text(
                "Ai correlation go plot possible causes of symptoms, mood, sleep quality, and"),
            Text("Show diet type change date"),
          ],
        ),
      ),
    );
  }
}
