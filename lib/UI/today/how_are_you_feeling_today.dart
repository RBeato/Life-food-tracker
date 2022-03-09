import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HowAreYouFeelingToday extends StatelessWidget {
  const HowAreYouFeelingToday({Key? key, required this.dailyResults})
      : super(key: key);

  final Map dailyResults;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.green.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
                "Change this information according to the selected view!",
                style: TextStyle(color: Colors.white)),
            // const Text("Sleep quality ring graphs"),
            // const Text("Energy level ring graphs"),
            // const Text("Mood ring graphs"),
            // const Text("Symptoms ring graphs"),
            // const Text("Weight: 75 Kg"),
            FittedBox(
              child: RadialGraph(dailyResults: dailyResults),
            ),
          ],
        ),
      ),
    );
  }
}

class RadialGraph extends StatefulWidget {
  const RadialGraph({Key? key, required this.dailyResults}) : super(key: key);
  final Map dailyResults;

  @override
  State<RadialGraph> createState() => _RadialGraphState();
}

class _RadialGraphState extends State<RadialGraph> {
  late List<DailyResultData> chartData;
  late Map selectedDailyResults;

  @override
  void initState() {
    chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.3),
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        series: <CircularSeries>[
          RadialBarSeries<DailyResultData, String>(
            dataSource: chartData,
            xValueMapper: (DailyResultData data, _) => data.name,
            yValueMapper: (DailyResultData data, _) => data.value,
            // Corner style of radial bar segment
            cornerStyle: CornerStyle.bothCurve,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            maximumValue: 10,
          )
        ],
      ),
    );
  }

  List<DailyResultData> getChartData() {
    List<DailyResultData> chartData = [];
    for (var action in Constants.autoEvaluationQuantifiedParameters) {
      chartData.add(DailyResultData(action, widget.dailyResults[action]));
    }
    return chartData;
  }
}

class DailyResultData {
  DailyResultData(this.name, this.value);
  final String name;
  final int value;
}
