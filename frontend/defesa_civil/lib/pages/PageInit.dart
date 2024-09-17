import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/headerFitHeight.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/components/textfieldSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPage.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:Cad_Med/services/user/addUser.dart';
import 'package:flutter/material.dart';

class PageInit extends StatefulWidget {
  const PageInit({super.key});

  @override
  State<PageInit> createState() => _PageInitState();
}

class _PageInitState extends State<PageInit> {
  final String rodapeTexto =
      "Bem-vindo ao CadMed! Para começar a sua jornada, precisamos de algumas informações básicas. Preencha os campos abaixo para criar seu perfil:";
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPosto = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  SqfliteHelper dbHelper = SqfliteHelper();

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
                          title: "Nome completo",
                          hintText: "nome completo",
                          controller: controllerNome,
                          icon: Icons.account_box_outlined),
                      // const SizedBox(height: 15),
                      textfieldSection(
                          keyboardType: TextInputType.text,
                          title: "Posto de atendimento",
                          hintText: "posto",
                          controller: controllerPosto,
                          icon: Icons.domain),
                      // const SizedBox(height: 15),
                      textfieldSection(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          title: "Senha do banco de dados",
                          hintText: "senha",
                          controller: controllerSenha,
                          icon: Icons.key),
                      const SizedBox(height: 30),
                      buttonPersonalizado(
                          maxWidth: sMaxwidth,
                          text: "Iniciar app",
                          onPressed: () async {
                            // verificando se todos os campos estão preenchidos corretamente
                            if (controllerNome.text.isEmpty ||
                                controllerPosto.text.isEmpty ||
                                controllerSenha.text.isEmpty) {
                              alertFailField(context);
                            } else {
                              alertSucess(context);
                              await addUser(
                                  dbHelper: dbHelper,
                                  nome: controllerNome.text,
                                  posto: controllerPosto.text,
                                  senha: controllerSenha.text);
                              Navigator.of(context).pushReplacement(
                                  SlideTransitionPage(page: PageInicio()));
                            }
                          }),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
