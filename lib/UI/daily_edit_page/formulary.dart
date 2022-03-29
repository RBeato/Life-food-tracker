import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                      Text(
                        "Weight: 76.0 Kg add textform field",
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 15.0),
                      AutoEvalQuantifiedParams(),
                    ],
                  ),
                ),
                CarouselList(parameters: Constants.routineActions),
                CarouselList(parameters: Constants.medsAndSymptoms),
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
