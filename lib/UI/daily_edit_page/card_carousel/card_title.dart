import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

class CardTitle extends ConsumerWidget {
  const CardTitle(this.parameter, {Key? key}) : super(key: key);

  final String parameter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(Constants.dailyRegisterToUIString[parameter]!);
  }
}
