import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/generic_edit_panel.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard(
    this.parameter, {
    Key? key,
  }) : super(key: key);
  final String parameter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 32.0,
          left: 8.0,
          right: 8.0,
        ),
        child: GenericEditPanel(parameter),
      ),
    );
  }
}
