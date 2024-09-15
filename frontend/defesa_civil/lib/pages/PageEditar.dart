import 'package:Cad_Med/components/SelectionSection.dart';
import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/components/textfieldSection.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/services/patologias/data.dart';
import 'package:flutter/material.dart';

class PageEditar extends StatefulWidget {
  final String nome;
  final int idade;
  final String genero;
  final String patologia;

  const PageEditar({
    super.key,
    required this.nome,
    required this.idade,
    required this.genero,
    required this.patologia,
  });

  @override
  State<PageEditar> createState() => _PageEditarState();
}

class _PageEditarState extends State<PageEditar> {
  late TextEditingController controllerTitle;
  late TextEditingController controllerAge;
  late TextEditingController controllerSelectGen;
  late TextEditingController controllerPatologia;
  List<String> lista_de_patologias = patologiasMaisVistas;
  bool visibleField = false;

  @override
  void initState() {
    super.initState();
    // Inicializando os controladores com os dados recebidos
    controllerTitle = TextEditingController(text: widget.nome);
    controllerAge = TextEditingController(text: widget.idade.toString());
    controllerSelectGen = TextEditingController(text: widget.genero);
    controllerPatologia = TextEditingController(text: widget.patologia);

    if (widget.patologia == "Outros") {
      visibleField =
          true; // Se "Outros" foi selecionado, o campo extra de patologia será exibido
    }
  }

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
                          title: "Atualizar dados",
                          text: "Preencha os campos abaixo"),
                      const SizedBox(height: 15),
                      textfieldSection(
                          keyboardType: TextInputType.name,
                          title: "Nome completo",
                          hintText: "Nome completo",
                          controller: controllerTitle,
                          icon: Icons.account_box_outlined),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 200,
                              child: textfieldSection(
                                  keyboardType: TextInputType.number,
                                  title: "Idade",
                                  hintText: "Idade",
                                  controller: controllerAge,
                                  icon: Icons.badge))),
                      selectionSection(
                          width: sMaxwidth - margem,
                          title: "Sexo",
                          icon: Icons.wc,
                          hintText: "o gênero",
                          controller: controllerSelectGen,
                          items: ['Selecione', 'Masculino', 'Feminino'],
                          selectedValue:
                              widget.genero, // Definindo o valor inicial
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
                          selectedValue:
                              widget.patologia, // Definindo o valor inicial
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
                          onPressed: () {
                            if (controllerTitle.text.isEmpty ||
                                controllerAge.text.isEmpty ||
                                controllerSelectGen.text.isEmpty ||
                                controllerPatologia.text.isEmpty ||
                                controllerPatologia.text == "Selecione" ||
                                controllerSelectGen.text == "Selecione") {
                              alertFailField(context);
                            } else {
                              alertSucessUpdate(context);
                              // Process the submission here
                            }
                          }),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
