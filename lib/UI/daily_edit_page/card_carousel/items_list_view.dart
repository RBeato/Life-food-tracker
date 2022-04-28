import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../parameter_list_edit_pop_up.dart';

class ItemsListView extends ConsumerWidget {
  ItemsListView(this.itemsList, {Key? key}) : super(key: key);

  final List<String> itemsList;
  late List<String> selectedItems = [];
  int crossAxisCount = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                          //Save Label text to Hive
                          // ref
                          //     .read(registerProvider.notifier)
                          //     .edit(description: );
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
