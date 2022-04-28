import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/common/dialog_box.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendar_view_selection.dart';

class TodayCalendar extends ConsumerWidget {
  const TodayCalendar({Key? key, required this.appointments}) : super(key: key);

  final List<Appointment> appointments;

  CalendarView getView(String value) {
    CalendarView view = CalendarView.day;
    if (value == "week") {
      view = CalendarView.week;
    }

    if (value == "month") {
      view = CalendarView.month;
    }
    return view;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(calendarViewProvider);

    return SfCalendar(
        headerStyle:
            const CalendarHeaderStyle(textStyle: TextStyle(fontSize: 12.0)),
        view: getView(value),
        dataSource: NutritionInfo(appointments),
        onTap: (value) {
          if (value.appointments != null) {
            Appointment appointment = value.appointments![0] as Appointment;
            String _title = appointment.subject;
            String _description = appointment.notes ?? "";

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialogBox(
                    title: _title,
                    descriptions: _description,
                    text: "close",
                  );
                });
            print("""Calendar value: 
          ${value.appointments![0].subject};
          ${value.date};
          ${value.resource};
          ${value.targetElement};
          """);
          }
        });
  }
}

class NutritionInfo extends CalendarDataSource {
  NutritionInfo(List<Appointment> source) {
    appointments = source;
  }
}
