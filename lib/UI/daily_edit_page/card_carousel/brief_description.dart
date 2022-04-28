import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/card_carousel/carousel_card.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/card_carousel/carousel_list.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/common/custom_text_field.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';

import '../../../constants.dart';

class BriefDescription extends ConsumerWidget {
  const BriefDescription(
      {required this.showLabelPanel,
      required this.textCtrl,
      required this.index,
      Key? key})
      : super(key: key);
  final bool showLabelPanel;
  final TextEditingController textCtrl;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String currentParameter = Constants.completeParameterOptions[index];
    final description = ref
            .watch(registerProvider.notifier)
            .getSingleRegister(currentParameter) ??
        "Add new ${Constants.dailyRegisterToUIString[currentParameter]}";

    int indexProvider = ref.watch(currentCardPageIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(), // to space items around
        showLabelPanel && index == indexProvider
            ? Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CustomTextField(
                      descriptionCtrl: textCtrl,
                      hintText: "Write something more about this!",
                      onEditingComplete: () {
                        //Save Label text to Hive
                        ref
                            .read(registerProvider.notifier)
                            .edit(description: textCtrl.text);
                        //Close panel
                        ref.read(showLabelPanelProvider.notifier).state =
                            !showLabelPanel;
                      },
                    ),
                  ),
                ],
              )
            : Text(
                "\"$description\"",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
        showLabelPanel
            ? Container()
            : IconButton(
                onPressed: () {
                  ref.read(currentCardPageIndexProvider.notifier).state = index;
                  ref.read(showLabelPanelProvider.notifier).state =
                      !showLabelPanel;
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 16.0,
                ),
              ),
      ],
    );
  }
}
