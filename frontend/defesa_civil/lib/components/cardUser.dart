import 'package:Cad_Med/services/text/truncateText.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget cardUser(
    {required width,
    nome = "Marco Antonio",
    id = "10",
    patologia = "ABCD",
    required Function onTap}) {
  nome = truncateText(nome, maxLength: 12);
  patologia = truncateText(patologia, maxLength: 12);
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      margin: EdgeInsets.only(top: 15),
      width: width,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Cor da sombra
            spreadRadius: 0, // Difusão da sombra
            blurRadius: 4, // Suavidade da sombra
            offset:
                Offset(0, 4), // Deslocamento da sombra (horizontal, vertical)
          ),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: Container(
              height: 120,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.badge,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          Expanded(
              flex: 70,
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText("Nome: $nome",
                              style: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text("ID: $id", style: TextStyle(fontSize: 15)),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText("Patologia: $patologia",
                              style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
