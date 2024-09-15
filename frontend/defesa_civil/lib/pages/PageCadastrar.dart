import 'package:Cad_Med/components/SelectionSection.dart';
import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/components/textfieldSection.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:Cad_Med/services/patologias/data.dart';
import 'package:flutter/material.dart';

class PageCadastrar extends StatefulWidget {
  const PageCadastrar({super.key});
  final String rodapeTexto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at vestibulum nisl, in pellentesque erat. Nam non eleifend dolor, nec gravida mauris. ";

  @override
  State<PageCadastrar> createState() => _PageCadastrarState();
}

class _PageCadastrarState extends State<PageCadastrar> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerSelectGen = TextEditingController();
  TextEditingController controllerPatologia = TextEditingController();
  List<String> lista_de_patologias = patologiasMaisVistas;

  @override
  Widget build(BuildContext context) {
    double sMaxwidth = MediaQuery.of(context).size.width;
    double margem = 60.0;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: [
              header(sMaxwidth),
              Column(children: [
                SizedBox(
                    width: sMaxwidth - margem,
                    child: Column(children: [
                      textSection(
                          title: "Coleta de dados", text: widget.rodapeTexto),
                      const SizedBox(height: 15),
                      textfieldSection(
                          keyboardType: TextInputType.name,
                          title: "nome completo",
                          hintText: "nome completo",
                          controller: controllerTitle,
                          icon: Icons.account_box_outlined),
                      // const SizedBox(height: 15),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 200,
                              child: textfieldSection(
                                  keyboardType: TextInputType.number,
                                  isNumeric: true,
                                  title: "idade",
                                  hintText: "idade",
                                  controller: controllerAge,
                                  icon: Icons.badge))),
                      // const SizedBox(height: 15),
                      selectionSection(
                          width: sMaxwidth - margem,
                          title: "Sexo",
                          icon: Icons.wc,
                          hintText: "o gênero",
                          controller: controllerSelectGen,
                          items: ['Selecione', 'Masculino', 'Feminino'],
                          selectedValue: 'Selecione', // Valor inicial
                          onChanged: (newValue) {
                            controllerSelectGen.text = newValue ?? '';
                          }),
                      const SizedBox(height: 15),
                      selectionSection(
                        width: sMaxwidth - margem,
                        title: "Patologia",
                        icon: Icons.menu,
                        hintText: "Patologia",
                        controller: controllerPatologia,
                        items: lista_de_patologias,
                        selectedValue: 'Selecione', // Valor inicial
                        onChanged: (newValue) {
                          controllerPatologia.text = newValue ?? '';
                        },
                      ),
                      const SizedBox(height: 50),
                      buttonPersonalizado(
                          maxWidth: sMaxwidth,
                          text: "Cadastrar",
                          onPressed: () {
                            // verificando se todos os campos estão preenchidos corretamente
                            if (controllerTitle.text.isEmpty ||
                                controllerAge.text.isEmpty ||
                                controllerSelectGen.text.isEmpty ||
                                controllerPatologia.text.isEmpty ||
                                controllerPatologia.text == "Selecione" ||
                                controllerSelectGen.text == "Selecione") {
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
