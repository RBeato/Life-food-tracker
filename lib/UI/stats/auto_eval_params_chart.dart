import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:lifestyle_tracker/repositories/mock_data_daily_routines.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

//https://www.youtube.com/watch?v=JAAnmOfoqg8&t=73s

class AutoEvalParamsChart extends StatefulWidget {
  const AutoEvalParamsChart({Key? key}) : super(key: key);

  @override
  State<AutoEvalParamsChart> createState() => _AutoEvalParamsChartState();
}

class _AutoEvalParamsChartState extends State<AutoEvalParamsChart> {
  late Map<String, List<Parameter>> chartData = {
    "sleepQuality": [],
    "energyLevel": [],
    "mood": [],
  };

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    for (var e in mockRegisters) {
      late DateTime date;
      if (e.registerCreationDate != null) {
        date = DateFormat("yyy-MM-dd").parse(e.registerCreationDate!);
      }
      for (var param in Constants.autoEvaluationQuantifiedParameters) {
        if (param == "sleepQuality") {
          chartData["sleepQuality"]!.add(Parameter(date, e.sleepQuality));
        }
        if (param == "energyLevel") {
          chartData["energyLevel"]!.add(Parameter(date, e.energyLevel));
        }
        if (param == "mood") {
          chartData["mood"]!.add(Parameter(date, e.mood));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
            tooltipBehavior:
                TooltipBehavior(activationMode: ActivationMode.singleTap),
            zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
            primaryXAxis: DateTimeAxis(
              intervalType: DateTimeIntervalType.days,
              interval: 1,
            ),
            series: <ChartSeries<Parameter, DateTime>>[
          // Renders line chart
          LineSeries<Parameter, DateTime>(
            emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
            dataSource: chartData["sleepQuality"]!,
            xValueMapper: (Parameter param, _) => param.date,
            yValueMapper: (Parameter param, _) => param.value,
          ),
          LineSeries<Parameter, DateTime>(
              emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
              dataSource: chartData["energyLevel"]!,
              xValueMapper: (Parameter param, _) => param.date,
              yValueMapper: (Parameter param, _) => param.value),
          LineSeries<Parameter, DateTime>(
              emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
              dataSource: chartData["mood"]!,
              xValueMapper: (Parameter param, _) => param.date,
              yValueMapper: (Parameter param, _) => param.value),
        ]));
  }
}

class Parameter {
  Parameter(this.date, this.value);

  DateTime? date;
  double? value;
}
