import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPage.dart';
import 'package:Cad_Med/pages/PageEditeUser.dart';
import 'package:flutter/material.dart';

class Pagesettings extends StatelessWidget {
  const Pagesettings({super.key});
  final String rodapeTexto =
      "Explore as configurações para personalizar sua experiência e garantir que o CadMed continue a atender às suas necessidades de forma eficaz e segura.";

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
              SizedBox(
                width: sMaxwidth - margem,
                child: Column(
                  children: [
                    textSection(
                      title: "Configuração",
                      text: rodapeTexto,
                    ),
                    const SizedBox(height: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttonPersonalizado(
                            maxWidth: sMaxwidth,
                            onPressed: () {
                              Navigator.of(context).push(
                                  SlideTransitionPage(page: PageEditeUser()));
                            },
                            text: "Editar cadastro"),
                        SizedBox(height: 15),
                        buttonPersonalizado(
                            maxWidth: sMaxwidth,
                            onPressed: () {},
                            text: "Exporta banco de dados"),
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
