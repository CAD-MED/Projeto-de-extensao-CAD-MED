import 'package:flutter/material.dart';

Widget textSection(
    {title = "", text = '', Color color = Colors.black, scale = 1.0}) {
  return SizedBox(
      child: Column(children: [
    const SizedBox(height: 20),
    Align(
        alignment: Alignment.topLeft,
        child: Text(title,
            style: TextStyle(
                fontSize: scale * 24,
                fontWeight: FontWeight.bold,
                color: color))),
    const SizedBox(height: 5),
    Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: scale * 14,
              fontWeight: FontWeight.normal,
              color: color.withOpacity(.5)),
          textAlign: TextAlign.justify,
        ))
  ]));
}
