import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarViewProvider = StateProvider<String>((ref) => "day");

class CalendarViewSelection extends StatelessWidget {
  const CalendarViewSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Button(title: "day"),
          _Button(title: "week"),
          _Button(title: "month"),
        ],
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          ref.read(calendarViewProvider.notifier).state = title;
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red[500]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Text(title),
            )),
      ),
    );
  }
}
