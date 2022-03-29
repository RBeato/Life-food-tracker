import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showDescriptionPanelProvider = StateProvider<bool>((ref) => false);
final descriptionStringProvider =
    StateProvider<String>((ref) => "Please add a description for today!");

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
    String descriptionString = ref.watch(descriptionStringProvider);

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
                      //TODO: Close all other opened panels
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
                  TextField(
                    controller: _descriptionCtrl,
                    decoration: const InputDecoration(
                      hintText: 'How was it?...',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      child: const Text("Save"),
                      onPressed: () {
                        ref.read(descriptionStringProvider.notifier).state =
                            _descriptionCtrl.text;
                        ref.read(showDescriptionPanelProvider.notifier).state =
                            !showDescriptionPanel;
                        //TODO: Close all other opened panels},
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
