import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker_spinner.dart';

import '../../constants.dart';

class CustomTimePicker extends StatefulWidget {
  CustomTimePicker(this.parameter, {Key? key}) : super(key: key);
  String parameter;

  @override
  State<CustomTimePicker> createState() => Custom_TimePickerState();
}

class Custom_TimePickerState extends State<CustomTimePicker> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Constants.needsTwoTimePickers(widget.parameter)
            ? Text("start:")
            : Text("at:"),
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
        Constants.needsTwoTimePickers(widget.parameter)
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
