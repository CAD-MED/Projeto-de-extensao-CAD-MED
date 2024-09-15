import 'package:defesa_civil/components/buttonPersonalizado.dart';
import 'package:defesa_civil/components/headerFitHeight.dart';
import 'package:defesa_civil/components/textSection.dart';
import 'package:defesa_civil/components/textfieldSection.dart';
import 'package:flutter/material.dart';

class PageInit extends StatefulWidget {
  const PageInit({super.key});

  @override
  State<PageInit> createState() => _PageInitState();
}

class _PageInitState extends State<PageInit> {
  final String rodapeTexto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at vestibulum nisl, in pellentesque erat. Nam non eleifend dolor, nec gravida mauris. ";
  TextEditingController controllerTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sMaxwidth = MediaQuery.of(context).size.width;
    double margem = 60.0;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: [
              headerFitHeight(sMaxwidth),
              Column(children: [
                SizedBox(
                    width: sMaxwidth - margem,
                    child: Column(children: [
                      textSection(
                          title: "Cadastro de usuario", text: rodapeTexto),
                      const SizedBox(height: 15),
                      textfieldSection(
                          title: "nome completo",
                          hintText: "nome completo",
                          controller: controllerTitle,
                          icon: Icons.account_box_outlined),
                      const SizedBox(height: 15),
                      textfieldSection(
                          title: "posto de atendimento",
                          hintText: "posto",
                          controller: controllerTitle,
                          icon: Icons.domain),
                      const SizedBox(height: 15),
                      textfieldSection(
                          title: "senha do banco de dados",
                          hintText: "senha",
                          controller: controllerTitle,
                          icon: Icons.key),
                      const SizedBox(height: 50),
                      buttonPersonalizado(
                          maxWidth: sMaxwidth,
                          text: "Iniciar app",
                          onPressed: () {}),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
