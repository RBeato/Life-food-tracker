import 'package:flutter/material.dart';

import 'formulary.dart';

class DailyEditPage extends StatefulWidget {
  final String title, descriptions, text;
  // final Image img;

  const DailyEditPage({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
    // required this.img,
  }) : super(key: key);

  @override
  _DailyEditPageState createState() => _DailyEditPageState();
}

class _DailyEditPageState extends State<DailyEditPage> {
  @override
  Widget build(BuildContext context) {
    return _contentBox(context);
  }

  _contentBox(context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const Formulary(),
          ],
        ),
      ),
    );
  }
}
