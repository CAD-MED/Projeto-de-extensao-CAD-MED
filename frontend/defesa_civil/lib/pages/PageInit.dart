import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/headerFitHeight.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/components/textfieldSection.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:flutter/material.dart';

class PageInit extends StatefulWidget {
  const PageInit({super.key});

  @override
  State<PageInit> createState() => _PageInitState();
}

class _PageInitState extends State<PageInit> {
  final String rodapeTexto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at vestibulum nisl, in pellentesque erat. Nam non eleifend dolor, nec gravida mauris. ";
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPosto = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

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
                          keyboardType: TextInputType.name,
                          title: "nome completo",
                          hintText: "nome completo",
                          controller: controllerNome,
                          icon: Icons.account_box_outlined),
                      const SizedBox(height: 15),
                      textfieldSection(
                          keyboardType: TextInputType.text,
                          title: "posto de atendimento",
                          hintText: "posto",
                          controller: controllerPosto,
                          icon: Icons.domain),
                      const SizedBox(height: 15),
                      textfieldSection(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          title: "senha do banco de dados",
                          hintText: "senha",
                          controller: controllerSenha,
                          icon: Icons.key),
                      const SizedBox(height: 50),
                      buttonPersonalizado(
                          maxWidth: sMaxwidth,
                          text: "Iniciar app",
                          onPressed: () {
                            // verificando se todos os campos estão preenchidos corretamente
                            if (controllerNome.text.isEmpty ||
                                controllerPosto.text.isEmpty ||
                                controllerSenha.text.isEmpty) {
                              alertFailField(context);
                            } else {
                              alertSucess(context);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PageInicio()));
                            }
                          }),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
