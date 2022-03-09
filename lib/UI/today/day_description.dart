import 'package:flutter/material.dart';

class DayDescription extends StatelessWidget {
  const DayDescription({Key? key, required this.description}) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "\"$description\"",
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Type of calendar view selection!\"",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
