import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/daily_edit_page.dart';
import 'package:lifestyle_tracker/UI/today_page/calendar_view_selection.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:lifestyle_tracker/repositories/mock_data_daily_routines.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendar.dart';
import 'day_description.dart';
import 'how_are_you_feeling_today.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  late List<Appointment> appointments = <Appointment>[];
  String dayDescription = "Today is the day!";
  DateTime now = DateTime.now();
  Map dailyResults = {};

  @override
  void initState() {
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    getDailyInfo(currentDate);
    super.initState();
  }

  //use!???
  @override
  void dispose() {
    Hive.close();
    //or
    Hive.box('registers').close();

    super.dispose();
  }

  getDailyInfo(DateTime currentDate) {
    mockRegisters
        .where(
            (register) => register.registerCreationDate.day == currentDate.day)
        .forEach((element) {
      dayDescription = element.description ?? dayDescription;
      for (var action in Constants.routineActions) {
        int counter = 1;
        element.toJson()[action].forEach((item) {
          appointments.add(Appointment(
            startTime: item.dateTime,
            endTime: item.dateTime.add(Duration(minutes: item.duration)),
            subject: "${item.title} ${counter > 1 ? counter : ''}",
            color: item.color,
          ));
          counter++;
        });
      }
      for (var action in Constants.autoEvaluationQuantifiedParameters) {
        dailyResults[action] = element.toJson()[action];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.add_box_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DailyEditPage()),
                  );
                },
              ),
            ),
          ),
          Expanded(flex: 2, child: DayDescription(description: dayDescription)),
          const Expanded(flex: 1, child: CalendarViewSelection()),
          Expanded(flex: 9, child: TodayCalendar(appointments: appointments)),
          Expanded(
              flex: 4, child: TodayCircularChart(dailyResults: dailyResults)),
        ],
      ),
    );
  }
}
