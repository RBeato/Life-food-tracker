import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/weight_text_form.dart';
import '../../constants.dart';
import 'description.dart';
import 'auto_eval_quantified_params.dart';
import 'carousel_list.dart';

final showSymptomsPanelProvider = StateProvider<bool>((ref) => false);

class Formulary extends ConsumerWidget {
  const Formulary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(flex: 1, child: Container()),
        const Expanded(
          flex: 2,
          child: Text(
            "Let's register something\nabout your day!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          flex: 20,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: const [
                      Description(),
                      SizedBox(height: 15.0),
                      WeightTextForm(),
                      SizedBox(height: 15.0),
                      AutoEvalQuantifiedParams(),
                    ],
                  ),
                ),
                CarouselList(parameters: [
                  ...Constants.routineActions,
                  ...Constants.medsAndSymptoms
                ]),
                const SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
