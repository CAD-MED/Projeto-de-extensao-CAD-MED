import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/pages/PageCadastrar.dart';
import 'package:flutter/material.dart';

class PageInicio extends StatelessWidget {
  const PageInicio({super.key});

  @override
  Widget build(BuildContext context) {
    double sMaxwidth = MediaQuery.of(context).size.width;
    double margem = 60.0;
    double buttonSize = ((sMaxwidth - margem) / 2) - 25;
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
                        scale: 1.2,
                        title: "Inicio",
                        text: "Seja bem vindo, Marco",
                        color: const Color(0xff558C54)),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PageCadastrar()));
                                },
                                title: "Cadastrar",
                                icon: Icons.group),
                            buttonEffect(
                                size: buttonSize,
                                onTap: () {},
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
                                  onTap: () {},
                                  title: "Configurar",
                                  icon: Icons.settings),
                              buttonEffect(
                                  size: buttonSize,
                                  onTap: () {},
                                  title: "Sobre",
                                  icon: Icons.view_cozy)
                            ]),
                        const SizedBox(height: 40),
                        Text("Projeto de extensão",
                            style: TextStyle(
                                fontSize: 20, color: Colors.green[800])),
                        const SizedBox(height: 5),
                        const Image(image: AssetImage("images/logoUnama.png")),
                        const SizedBox(height: 5),
                        Text("Faculdade Unama",
                            style: TextStyle(
                                fontSize: 20, color: Colors.green[800])),
                        const SizedBox(height: 100),
                      ],
                    )
                  ],
                ),
              )
            ]))));
  }
}

Widget buttonEffect(
    {required size,
    required Function onTap,
    IconData icon = Icons.group,
    title = "Cadastrar"}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, left: 8),
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.green[600]?.withOpacity(0.7),
              borderRadius: BorderRadius.circular(18)),
        ),
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: const EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "LilitaOne",
                            color: Colors.white),
                      ))),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
