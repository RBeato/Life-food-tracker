import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';

import 'custom_text_field.dart';

final showDescriptionPanelProvider = StateProvider<bool>((ref) => false);

class Description extends ConsumerStatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends ConsumerState<Description> {
  late TextEditingController _descriptionCtrl;

  @override
  void initState() {
    super.initState();
    _descriptionCtrl = TextEditingController(); //received saved description
  }

  @override
  Widget build(BuildContext context) {
    bool showDescriptionPanel = ref.watch(showDescriptionPanelProvider);
    String descriptionString = ref.watch(registerProvider).description ??
        "Please add a description for today!";

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
                      hintText: "How was your day?"),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      child: const Text("Save"),
                      onPressed: () {
                        ref.read(showDescriptionPanelProvider.notifier).state =
                            !showDescriptionPanel;
                        ref
                            .read(registerProvider.notifier)
                            .edit(description: _descriptionCtrl.text);
                      },
                    ),
                  ),
                ],
              )
            : Text(
                "\"$descriptionString\"",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
      ],
    );
  }
}
