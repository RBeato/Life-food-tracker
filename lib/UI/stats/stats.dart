import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Days you stick to the diet!"),
            Text("Detailed graphs of energy through selected time"),
            Text("Graph of sleep trough selected time"),
            Text("Graph of mood trough selected time"),
            Text(
                "Ai correlation go plot possible causes of symptoms, mood, sleep quality, and"),
          ],
        ),
      ),
    );
  }
}
