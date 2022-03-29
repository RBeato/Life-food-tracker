import 'package:flutter/material.dart';
import 'formulary.dart';

class DailyEditPage extends StatefulWidget {
  const DailyEditPage({
    Key? key,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    //if there is no register create
                    //if there is edit
                    //PLACE THIS logic inside the provider
                  },
                ),
              ],
            ),
            const Formulary(),
          ],
        ),
      ),
    );
  }
}
