import 'package:flutter/material.dart';

Widget header(sMaxwidth) {
  return Container(
    height: 130,
    width: sMaxwidth,
    decoration: const BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
            fit: BoxFit.fitWidth, image: AssetImage("images/banner1.png"))),
    child: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Image(image: AssetImage("images/logo.png")))),
  );
}
