import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/today_page/calendar_view_selection.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends ConsumerWidget {
  const Calendar({Key? key}) : super(key: key);

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
    final calendarView = getView(value);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SfCalendar(
            view: calendarView,
            onLongPress: (_) {},
            monthViewSettings: MonthViewSettings(
              showAgenda: true,
              agendaViewHeight: MediaQuery.of(context).size.height * 0.3,
              agendaItemHeight: 30,
            ),
            allowAppointmentResize: true,
            onTap: (value) {
              print("""Calendar value: 
              ${value.appointments};
              ${value.date};
              ${value.resource};
              ${value.targetElement};
              """);
            }),
      ),
    );
  }
}
