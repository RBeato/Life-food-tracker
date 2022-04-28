import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';

import 'common/custom_text_field.dart';
import 'common/custom_text_field.dart';

final showDescriptionPanelProvider = StateProvider<bool>((ref) => false);

class Description extends ConsumerStatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends ConsumerState<Description> {
  late TextEditingController _descriptionCtrl;
  bool showDescriptionPanel = false;

  @override
  void initState() {
    super.initState();
    _descriptionCtrl = TextEditingController(); //received saved description
  }

  void onEditingComplete() {
    saveDescription();
    closeForm();
  }

  void saveDescription() {
    ref
        .read(registerProvider.notifier)
        .edit(description: _descriptionCtrl.text);
  }

  void closeForm() {
    ref.read(showDescriptionPanelProvider.notifier).state =
        !showDescriptionPanel;
  }

  @override
  Widget build(BuildContext context) {
    showDescriptionPanel = ref.watch(showDescriptionPanelProvider);
    String? description = ref.watch(registerProvider).description;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Description"),
            showDescriptionPanel
                ? Container()
                : IconButton(
                    onPressed: () {
                      ref.read(showDescriptionPanelProvider.notifier).state =
                          !showDescriptionPanel;
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 16.0,
                    ),
                  ),
          ],
        ),
        showDescriptionPanel
            ? Column(
                children: [
                  CustomTextField(
                    descriptionCtrl: _descriptionCtrl,
                    hintText: "How was your day?",
                    onEditingComplete: () {
                      onEditingComplete();
                    },
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: ElevatedButton(
                  //     child: const Text("Save"),
                  //     onPressed: () {
                  //       onEditingComplete();
                  //     },
                  //   ),
                  // ),
                ],
              )
            : Text(
                "\"$description\"",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
      ],
    );
  }
}
