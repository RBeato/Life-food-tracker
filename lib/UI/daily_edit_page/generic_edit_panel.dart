import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker.dart';
import 'package:lifestyle_tracker/providers/daily_register_provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants.dart';
import 'custom_text_field.dart';
import 'parameter_list_edit_pop_up.dart';

final showLabelPanelProvider = StateProvider<bool>((ref) => false);

class GenericEditPanel extends ConsumerStatefulWidget {
  const GenericEditPanel(this.parameter, {Key? key}) : super(key: key);

  final String parameter;

  @override
  _GenericEditPanelState createState() => _GenericEditPanelState();
}

class _GenericEditPanelState extends ConsumerState<GenericEditPanel> {
  late TextEditingController _descriptionCtrl;

  @override
  void initState() {
    super.initState();
    _descriptionCtrl = TextEditingController(); //received saved description
  }

  @override
  Widget build(BuildContext context) {
    bool _showLabelPanel = ref.watch(showLabelPanelProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(Constants.dailyRegisterToUIString[widget.parameter]!),
            Label(showLabelPanel: _showLabelPanel, textCtrl: _descriptionCtrl),
            ListOfItems(Constants.allItems[widget.parameter]!),
            Constants.needsTimePicker(widget.parameter)
                ? CustomTimePicker(widget.parameter)
                : Container(),
            Constants.needsQualitySlider(widget.parameter)
                ? QualitySlider(widget.parameter)
                : Container(),
          ],
        ),
      ),
    );
  }
}

class Label extends ConsumerWidget {
  const Label({required this.showLabelPanel, required this.textCtrl, Key? key})
      : super(key: key);
  final bool showLabelPanel;
  final TextEditingController textCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String descriptionString =
        ref.watch(registerProvider).description ?? "Add a custom label!";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(), // to space items around
        showLabelPanel
            ? Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CustomTextField(
                        descriptionCtrl: textCtrl,
                        hintText: "Write something more about this!"),
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: ElevatedButton(
                  //     child: const Text("Save"),
                  //     onPressed: () {
                  //       ref.read(showLabelPanelProvider.notifier).state =
                  //           !showLabelPanel;
                  //       ref
                  //           .read(registerProvider.notifier)
                  //           .edit(description: textCtrl.text);
                  //     },
                  //   ),
                  // ),
                ],
              )
            : Text(
                "\"$descriptionString\"",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
        showLabelPanel
            ? Container()
            : IconButton(
                onPressed: () {
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

class ListOfItems extends StatelessWidget {
  ListOfItems(this.itemsList, {Key? key}) : super(key: key);

  final List<String> itemsList;
  List<String> selectedItems = [];
  int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                ...itemsList
                    .map((element) => GestureDetector(
                        onTap: () {
                          if (selectedItems.contains(element)) {
                            selectedItems
                                .removeWhere((element) => element == element);
                          } else {
                            selectedItems.add(element);
                          }
                          // ref.read(symptomsListProvider.notifier).state =
                          //     selectedItems;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedItems.contains(element)
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  element,
                                  style: TextStyle(
                                      color: selectedItems.contains(element)
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              )),
                        )))
                    .toList(),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ParameterListEditPopUp(); //!pass list of items
                        });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 16.0,
                  ),
                ),
              ]),
        ));
  }
}

class QualitySlider extends StatefulWidget {
  const QualitySlider(this.parameter, {Key? key}) : super(key: key);

  final String parameter;

  @override
  State<QualitySlider> createState() => _QualitySliderState();
}

class _QualitySliderState extends State<QualitySlider> {
  final double _min = 0;
  final double _max = 10;
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Quality"),
        SfSlider(
          labelPlacement: LabelPlacement.betweenTicks,
          enableTooltip: true,
          interval: 1,
          min: _min,
          max: _max,
          stepSize: 1,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        ),
      ],
    );
  }
}
