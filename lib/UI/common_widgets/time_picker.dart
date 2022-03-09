import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker_spinner.dart';

class CustomTimePicker extends StatefulWidget {
  CustomTimePicker({Key? key, this.twoTimePickers = true}) : super(key: key);
  bool twoTimePickers;

  @override
  State<CustomTimePicker> createState() => Custom_TimePickerState();
}

class Custom_TimePickerState extends State<CustomTimePicker> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool twoPickers = widget.twoTimePickers;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        twoPickers ? Text("start:") : Text("at:"),
        Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10.0,
            ),
            child: TimePickerSpinner(
              is24HourMode: false,
              onTimeChange: (time) {
                setState(() {
                  _dateTime = time;
                });
              },
            )),
        twoPickers
            ? Row(children: [
                SizedBox(width: 35.0),
                Text("end:"),
                Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10.0,
                    ),
                    child: TimePickerSpinner(
                      is24HourMode: false,
                      onTimeChange: (time) {
                        setState(() {
                          _dateTime = time;
                        });
                      },
                    )),
              ])
            : Container(),
      ],
    );
  }
}
