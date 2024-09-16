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
import 'package:Cad_Med/services/paciente/deleteOnePaciente.dart';
import 'package:Cad_Med/services/paciente/getOnePaciente.dart';
import 'package:Cad_Med/services/paciente/updatePaciente.dart';
import 'package:flutter/material.dart';

class PageEditar extends StatefulWidget {
  final int userId; // ID do usuário para busca

  const PageEditar({super.key, required this.userId});

  @override
  State<PageEditar> createState() => _PageEditarState();
}

class _PageEditarState extends State<PageEditar> {
  SqfliteHelper dbHelper = SqfliteHelper();
  late TextEditingController controllerTitle;
  late TextEditingController controllerAge;
  late TextEditingController controllerSelectGen;
  late TextEditingController controllerPatologia;

  List<String> lista_de_patologias = patologiasMaisVistas;
  bool visibleField = false;

  @override
  void initState() {
    super.initState();

    // Inicializa os controladores vazios, depois preenche com dados do "banco"
    controllerTitle = TextEditingController();
    controllerAge = TextEditingController();
    controllerSelectGen = TextEditingController();
    controllerPatologia = TextEditingController();

    // Simula a busca do usuário pelo ID
    getpacienteById(dbHelper: dbHelper, userId: widget.userId).then((userData) {
      if (userData.isNotEmpty) {
        // Preenche os controladores com os dados do banco
        setState(() {
          controllerTitle.text = userData['nome'];
          controllerAge.text = userData['idade'].toString();
          controllerSelectGen.text = userData['genero'];
          controllerPatologia.text = userData['patologia'];

          // Se a patologia for "Outros", exibe o campo extra
          if (userData['patologia'] == "Outros") {
            visibleField = true;
          }
        });
      }
    });
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
                              controllerSelectGen.text, // Valor inicial
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
                              controllerPatologia.text, // Valor inicial
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
                          text: "Atualizar",
                          onPressed: () async {
                            if (controllerTitle.text.isEmpty ||
                                controllerAge.text.isEmpty ||
                                controllerSelectGen.text.isEmpty ||
                                controllerPatologia.text.isEmpty ||
                                controllerPatologia.text == "Selecione" ||
                                controllerSelectGen.text == "Selecione") {
                              alertFailField(context);
                            } else {
                              alertSucessUpdate(context);
                              await updatePaciente(
                                  dbHelper: dbHelper,
                                  id: widget.userId,
                                  nome: controllerTitle.text,
                                  patologia: controllerPatologia.text,
                                  genero: controllerSelectGen.text,
                                  idade: controllerAge.text);
                              // Process the update here
                              navigateAndRemoveUntil(context, PageInicio());
                            }
                          }),
                      SizedBox(height: 10),
                      buttonPersonalizado(
                          color: Colors.red,
                          maxWidth: sMaxwidth,
                          text: "Deletar",
                          onPressed: () async {
                            alertSucessDelete(context);
                            await deletePaciente(
                              dbHelper: dbHelper,
                              id: widget.userId,
                            );
                            // Process the update here
                            navigateAndRemoveUntil(context, PageInicio());
                          }),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
