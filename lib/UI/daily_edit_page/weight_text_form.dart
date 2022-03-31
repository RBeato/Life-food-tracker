import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/models/daily_register.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';

class WeightTextForm extends ConsumerStatefulWidget {
  const WeightTextForm({Key? key}) : super(key: key);

  @override
  WeightTextFormState createState() => WeightTextFormState();
}

class WeightTextFormState extends ConsumerState<WeightTextForm> {
  // late DailyRegister dailyRegister;

  @override
  void initState() {
    super.initState();
    // dailyRegister = ref.read(registerProvider); //not used
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Weight: ",
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.03,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText:
                  // dailyRegister.registerCreationDate ??
                  "23.45", //last saved value
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              double weight = double.parse(value);
              ref.read(registerProvider.notifier).edit(bodyWeight: weight);
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
            ], // Only numbers can be entered
          ),
        ),
      ],
    );
  }
}
