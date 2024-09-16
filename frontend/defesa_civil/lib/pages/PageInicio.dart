import 'package:Cad_Med/components/buttonEffect.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPage.dart';
import 'package:Cad_Med/pages/PageCadastrar.dart';
import 'package:Cad_Med/pages/PageSettings.dart';
import 'package:Cad_Med/pages/PageSobre.dart';
import 'package:Cad_Med/pages/PageVisualizarCadastros.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:Cad_Med/services/user/getAllLogin.dart';
import 'package:flutter/material.dart';

class PageInicio extends StatefulWidget {
  const PageInicio({super.key});

  @override
  State<PageInicio> createState() => _PageInicioState();
}

class _PageInicioState extends State<PageInicio> {
  SqfliteHelper dbHelper = SqfliteHelper();
  List userData = [];
  @override
  void initState() {
    super.initState();
    getAllLogin(dbHelper: dbHelper).then((data) {
      setState(() {
        userData = data;
      });
    });
  }

  Widget build(BuildContext context) {
    double sMaxwidth = MediaQuery.of(context).size.width;
    double margem = 60.0;
    double buttonSize = ((sMaxwidth - margem) / 2) - 25;
    if (sMaxwidth > 500) {
      buttonSize = ((400 - margem) / 2) - 25;
      ;
    }
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: [
              header(sMaxwidth),
              Container(
                width: sMaxwidth > 500 ? 400 : (sMaxwidth - margem),
                child: Column(
                  children: [
                    userData.isNotEmpty
                        ? textSection(
                            scale: 1.2,
                            title: "Inicio",
                            text: "Seja bem vindo, ${userData[0]['nome']}",
                            color: const Color(0xff558C54))
                        : Container(),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buttonEffect(
                                size: buttonSize,
                                onTap: () {
                                  Navigator.of(context).push(
                                      SlideTransitionPage(
                                          page: PageCadastrar()));
                                },
                                title: "Cadastrar",
                                icon: Icons.group),
                            buttonEffect(
                                size: buttonSize,
                                onTap: () {
                                  Navigator.of(context).push(
                                      SlideTransitionPage(
                                          page: PageVisualizarCadastro()));
                                },
                                title: "Visualizar",
                                icon: Icons.dashboard),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonEffect(
                                  size: buttonSize,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        SlideTransitionPage(
                                            page: Pagesettings()));
                                  },
                                  title: "Configurar",
                                  icon: Icons.settings),
                              buttonEffect(
                                  size: buttonSize,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        SlideTransitionPage(page: PageSobre()));
                                  },
                                  title: "Sobre",
                                  icon: Icons.view_cozy)
                            ]),
                        const SizedBox(height: 40),
                        sectionLogoExtensao(),
                        const SizedBox(height: 100),
                      ],
                    )
                  ],
                ),
              )
            ]))));
  }
}

Widget sectionLogoExtensao() {
  return SizedBox(
      child: Column(children: [
    Text("Projeto de extensão",
        style: TextStyle(fontSize: 20, color: Colors.green[800])),
    const SizedBox(height: 5),
    const Image(image: AssetImage("images/logoUnama.png")),
    const SizedBox(height: 5),
    Text("Faculdade Unama",
        style: TextStyle(fontSize: 20, color: Colors.green[800])),
  ]));
}
