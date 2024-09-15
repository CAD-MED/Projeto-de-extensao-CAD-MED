import 'package:flutter/material.dart';

Widget textSection({title = "", text = ''}) {
  return SizedBox(
      child: Column(children: [
    const SizedBox(height: 20),
    Align(
        alignment: Alignment.topLeft,
        child: Text(title,
            style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black))),
    const SizedBox(height: 5),
    Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(.5)),
          textAlign: TextAlign.justify,
        ))
  ]));
}
