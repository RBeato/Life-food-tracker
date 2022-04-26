import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TodayCircularChart extends StatefulWidget {
  const TodayCircularChart({Key? key, required this.dailyResults})
      : super(key: key);

  final Map dailyResults;

  @override
  State<TodayCircularChart> createState() => _TodayCircularChartState();
}

class _TodayCircularChartState extends State<TodayCircularChart> {
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
        borderColor: Colors.green,
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
  final double value;
}
