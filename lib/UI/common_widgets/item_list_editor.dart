import 'package:flutter/material.dart';

import '../../constants.dart';

class ItemListEditor extends StatefulWidget {
  ItemListEditor({Key? key}) : super(key: key);

  @override
  State<ItemListEditor> createState() => _ItemListEditorState();
}

class _ItemListEditorState extends State<ItemListEditor> {
  final key = GlobalKey<AnimatedListState>();

  final items = List.from(Constants.typesOfSupplements);

  @override
  Widget build(BuildContext context) {
    print("items: $items");
    return Column(children: [
      Expanded(
          child: AnimatedList(
              key: key,
              initialItemCount: items.length,
              itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) =>
                  buildItem(items[index], index, animation))),
      Container(
        padding: EdgeInsets.all(5),
        child: buildInsertButton(),
      )
    ]);
  }

  Widget buildItem(String item, int index, Animation<double> animation) =>
      ListItem(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );

  Widget buildInsertButton() => ElevatedButton(
      onPressed: () {
        // insertItem(0, ListItem(items.first,animation:animation, );
      },
      child: Text("Add Item"));

  void insertItem(int index, ListItem item) {
    items.insert(index, item);
    key.currentState?.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);
    key.currentState?.removeItem(
        index, (context, animation) => buildItem(item, index, animation));
  }
}

class ListItem extends StatelessWidget {
  ListItem(
      {Key? key,
      required this.item,
      required this.animation,
      required this.onClicked})
      : super(key: key);

  final String item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue.withOpacity(0.2)),
        child: ListTile(
            title: Text(item),
            contentPadding:
                const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
            // leading: CircleAvatar(radius: 15),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: onClicked,
            )),
      ),
    );
  }
}
