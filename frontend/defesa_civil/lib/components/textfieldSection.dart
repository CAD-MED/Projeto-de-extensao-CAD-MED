import 'package:flutter/material.dart';

Widget textfieldSection(
    {IconData icon = Icons.account_box_outlined,
    String title = "",
    String hintText = "",
    required TextEditingController controller}) {
  return SizedBox(
      child: Column(children: [
    Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(.8)))),
    const SizedBox(height: 8),
    TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: "digite " + hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10))))
  ]));
}
