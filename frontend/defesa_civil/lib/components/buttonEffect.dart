import 'package:flutter/material.dart';

Widget buttonEffect(
    {required size,
    required Function onTap,
    IconData icon = Icons.group,
    title = "Cadastrar"}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, left: 8),
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.green[600]?.withOpacity(0.7),
              borderRadius: BorderRadius.circular(18)),
        ),
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: const EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "LilitaOne",
                            color: Colors.white),
                      ))),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
