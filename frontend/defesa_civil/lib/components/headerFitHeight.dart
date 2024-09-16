import 'package:flutter/material.dart';

Widget headerFitHeight(sMaxwidth) {
  return Container(
    height: 250,
    width: sMaxwidth,
    decoration: const BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
            fit: BoxFit.fitHeight, image: AssetImage("images/banner1.png"))),
    child: const Center(child: Image(image: AssetImage("images/logo.png"))),
  );
}
