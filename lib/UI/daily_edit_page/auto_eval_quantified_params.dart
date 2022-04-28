import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/constants.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';

import 'common/slider_button.dart';

class AutoEvalQuantifiedParams extends ConsumerWidget {
  const AutoEvalQuantifiedParams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Register register = ref.watch(registerProvider.notifier);

    return Column(
        children: Constants.autoEvaluationQuantifiedParameters
            .map((item) => SliderButton(item))
            .toList());
  }
}
