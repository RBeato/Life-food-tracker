import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.descriptionCtrl,
      required this.hintText,
      required this.onEditingComplete})
      : super(key: key);

  TextEditingController descriptionCtrl;
  String hintText;
  VoidCallback onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionCtrl,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      onEditingComplete: onEditingComplete,
    );
  }
}
