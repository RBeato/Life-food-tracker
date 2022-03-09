import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SfCalendar(
            view: CalendarView.month,
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
