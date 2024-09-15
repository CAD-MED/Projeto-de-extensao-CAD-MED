import 'package:flutter/material.dart';

Widget buttonPersonalizado(
    {required maxWidth, required text, required Function onPressed}) {
  return SizedBox(
    width: maxWidth,
    height: 60,
    child: FilledButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Color(0xff558C54)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Defina o valor desejado para o raio da borda
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontFamily: "LilitaOne"),
      ),
    ),
  );
}
