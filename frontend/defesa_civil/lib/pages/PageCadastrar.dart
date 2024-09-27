import 'package:Cad_Med/components/SelectionSection.dart';
import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/components/textfieldSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPageRemove.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:Cad_Med/services/patologias/data.dart';
import 'package:Cad_Med/services/paciente/addPaciente.dart';
import 'package:flutter/material.dart';

class PageCadastrar extends StatefulWidget {
  const PageCadastrar({super.key});
  final String rodapeTexto =
      "Para oferecer uma experiência personalizada, precisamos coletar algumas informações adicionais sobre sua saúde. Preencha os campos abaixo:";

  @override
  State<PageCadastrar> createState() => _PageCadastrarState();
}

class _PageCadastrarState extends State<PageCadastrar> {
  SqfliteHelper dbHelper = SqfliteHelper();
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerSelectGen = TextEditingController();
  TextEditingController controllerPatologia = TextEditingController();
  List<String> lista_de_patologias = patologiasMaisVistas;
  bool visibleField = false;

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
                          title: "Nome completo",
                          hintText: "Nome completo",
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
                                  title: "Idade",
                                  hintText: "Idade",
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
                            if (newValue == "Outros") {
                              setState(() {
                                visibleField = true;
                                controllerPatologia.text = "";
                              });
                            } else {
                              setState(() {
                                visibleField = false;
                              });
                              controllerPatologia.text = newValue ?? '';
                            }
                          }),
                      visibleField ? const SizedBox(height: 15) : Container(),
                      visibleField
                          ? textfieldSection(
                              keyboardType: TextInputType.name,
                              title: "Adicione a patologia",
                              hintText: "Patologia",
                              controller: controllerPatologia,
                              icon: Icons.menu)
                          : Container(),
                      const SizedBox(height: 50),
                      buttonPersonalizado(
                          maxWidth: sMaxwidth,
                          text: "Cadastrar",
                          onPressed: () async {
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
                              await addPaciente(
                                  dbHelper: dbHelper,
                                  nome: controllerTitle.text,
                                  patologia: controllerPatologia.text,
                                  genero: controllerSelectGen.text,
                                  idade: controllerAge.text);
                              navigateAndRemoveUntil(context, PageInicio());
                            }
                          }),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
