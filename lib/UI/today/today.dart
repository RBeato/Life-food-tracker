import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/UI/common_widgets/dialog_box.dart';
import 'package:lifestyle_tracker/UI/today/day_description.dart';
import 'package:lifestyle_tracker/UI/today/how_are_you_feeling_today.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:lifestyle_tracker/repositories/mock_data_daily_routines.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'daily_edit/daily_edit_page.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
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
                        builder: (context) => const DailyEditPage(
                              title: "Custom Dialog Demo",
                              descriptions:
                                  "Hi all this is a custom dialog in flutter and  you will be use in your flutter applications",
                              text: "Yes",
                            )),
                  );
                },
              ),
            ),
          ),
          Expanded(flex: 3, child: DayDescription(description: dayDescription)),
          Expanded(flex: 7, child: TodayCalendar(appointments: appointments)),
          Expanded(
              flex: 4,
              child: HowAreYouFeelingToday(dailyResults: dailyResults)),
        ],
      ),
    );
  }
}

class TodayCalendar extends StatelessWidget {
  const TodayCalendar({Key? key, required this.appointments}) : super(key: key);

  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
        view: CalendarView.day,
        dataSource: NutritionInfo(appointments),
        onTap: (value) {
          if (value.appointments != null) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomDialogBox(
                    title: "Custom Dialog Demo",
                    descriptions:
                        "Hi all this is a custom dialog in flutter and  you will be use in your flutter applications",
                    text: "Yes",
                  );
                });
          }
          print("""Calendar value: 
          ${value.appointments};
          ${value.date};
          ${value.resource};
          ${value.targetElement};
          """);
        });
  }
}

class NutritionInfo extends CalendarDataSource {
  NutritionInfo(List<Appointment> source) {
    appointments = source;
  }
}
