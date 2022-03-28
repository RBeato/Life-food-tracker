import 'package:flutter/material.dart';
import 'package:lifestyle_tracker/UI/common_widgets/time_picker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants.dart';
import 'parameter_list_edit_pop_up.dart';

class GenericEditPanel extends StatelessWidget {
  GenericEditPanel(this.parameter, {Key? key}) : super(key: key);

  final String parameter;

  String parameterName = "Meal";
  String label = "Something the user writes";

  @override
  Widget build(BuildContext context) {
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
            Text(Constants.dailyRegisterToUIString[parameter]!),
            Text("Label"),
            ListOfItems(Constants.allItems[parameter]!),
            Constants.needsTimePicker(parameter)
                ? CustomTimePicker(parameter)
                : Container(),
            Constants.needsQualitySlider(parameter)
                ? QualitySlider(parameter)
                : Container(),
          ],
        ),
      ),
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
