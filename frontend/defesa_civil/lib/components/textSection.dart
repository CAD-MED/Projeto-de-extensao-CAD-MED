import 'package:flutter/material.dart';

Widget textSection(
    {title = "",
    text = '',
    Color color = Colors.black,
    scale = 1.0,
    String image = ""}) {
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
    image.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(20)),
          )
        : Container(),
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
