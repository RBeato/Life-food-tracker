import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:lifestyle_tracker/models/auto_evaluation_parameters.dart';
import 'package:lifestyle_tracker/models/auto_evaluation_parameters_options.dart';
import 'package:lifestyle_tracker/repositories/mock_data_daily_routines.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//https://www.youtube.com/watch?v=JAAnmOfoqg8&t=73s

class EnergyChart extends StatefulWidget {
  const EnergyChart({Key? key}) : super(key: key);

  @override
  State<EnergyChart> createState() => _EnergyChartState();
}

class _EnergyChartState extends State<EnergyChart> {
  late Map<String, List<AutoEvaluationParameter>> chartData = {
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
      for (var param in Constants.autoEvaluationQuantifiedParameters) {
        if (param == "sleepQuality") {
          chartData["sleepQuality"]!.add(SleepQuality(
              DateTime(
                e.registerCreationDate.year,
                e.registerCreationDate.month,
                e.registerCreationDate.day,
              ),
              e.sleepQuality!));
        }
        if (param == "energyLevel") {
          chartData["energyLevel"]!.add(EnergyLevel(
              DateTime(
                e.registerCreationDate.year,
                e.registerCreationDate.month,
                e.registerCreationDate.day,
              ),
              e.energyLevel!));
        }
        if (param == "mood") {
          chartData["mood"]!.add(MoodLevel(
              DateTime(
                e.registerCreationDate.year,
                e.registerCreationDate.month,
                e.registerCreationDate.day,
              ),
              e.mood!));
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
            series: <ChartSeries<AutoEvaluationParameter, DateTime>>[
          // Renders line chart
          LineSeries<AutoEvaluationParameter, DateTime>(
            dataSource: chartData["sleepQuality"]!,
            xValueMapper: (AutoEvaluationParameter param, _) => param.date,
            yValueMapper: (AutoEvaluationParameter param, _) => param.value,
          ),
          LineSeries<AutoEvaluationParameter, DateTime>(
              dataSource: chartData["energyLevel"]!,
              xValueMapper: (AutoEvaluationParameter param, _) => param.date,
              yValueMapper: (AutoEvaluationParameter param, _) => param.value),
          LineSeries<AutoEvaluationParameter, DateTime>(
              dataSource: chartData["mood"]!,
              xValueMapper: (AutoEvaluationParameter param, _) => param.date,
              yValueMapper: (AutoEvaluationParameter param, _) => param.value),
        ]));
  }
}
