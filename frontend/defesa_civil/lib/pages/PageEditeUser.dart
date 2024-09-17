import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/headerFitHeight.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/components/textfieldSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPageRemove.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:Cad_Med/services/user/getAllLogin.dart';
import 'package:Cad_Med/services/user/updateUser.dart';
import 'package:flutter/material.dart';

class PageEditeUser extends StatefulWidget {
  const PageEditeUser({super.key});

  @override
  State<PageEditeUser> createState() => _PageEditeUserState();
}

class _PageEditeUserState extends State<PageEditeUser> {
  final String rodapeTexto =
      "Bem-vindo ao CadMed! Para começar a sua jornada, precisamos de algumas informações básicas. Preencha os campos abaixo para criar seu perfil:";

  SqfliteHelper dbHelper = SqfliteHelper();
  // Controladores dos campos de texto
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPosto = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getAllLogin(dbHelper: dbHelper).then((data) {
      setState(() {
        controllerNome.text = data[0]["nome"];
        controllerPosto.text = data[0]["posto"];
        controllerSenha.text = data[0]["senha"];
      });
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
              child: Column(
                children: [
                  headerFitHeight(sMaxwidth), // Cabeçalho da página
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
                        textfieldSection(
                            keyboardType: TextInputType.text,
                            title: "posto de atendimento",
                            hintText: "posto",
                            controller: controllerPosto,
                            icon: Icons.domain),
                        textfieldSection(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            title: "senha do banco de dados",
                            hintText: "senha",
                            controller: controllerSenha,
                            icon: Icons.key),
                        const SizedBox(height: 30),
                        loading
                            ? CircularProgressIndicator()
                            : buttonPersonalizado(
                                maxWidth: sMaxwidth,
                                text: "Atualizar cadastro",
                                onPressed: () async {
                                  // Verificando se todos os campos estão preenchidos corretamente
                                  if (controllerNome.text.isEmpty ||
                                      controllerPosto.text.isEmpty ||
                                      controllerSenha.text.isEmpty) {
                                    alertFailField(context);
                                  } else {
                                    alertSucessUpdate(context);
                                    // função para atualizar database
                                    setState(() {
                                      loading = true;
                                    });
                                    await updateUser(
                                        dbHelper: dbHelper,
                                        id: 1,
                                        nome: controllerNome.text,
                                        posto: controllerPosto.text,
                                        senha: controllerSenha.text);
                                    //

                                    navigateAndRemoveUntil(
                                        context, PageInicio());
                                  }
                                }),
                        const SizedBox(height: 100),
                      ])),
                ],
              ),
            )));
  }
}
