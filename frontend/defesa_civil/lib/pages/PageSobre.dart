import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:flutter/material.dart';

const EQUIPE = """
Orientador
    - Erminio Paixão

Desenvolvedores
    - Marco Antonio
    - Rafael Góes Duarte
    - Luan Levi Barbosa de Carvalho
    - Alberto Monteiro Miranda Junior
    - Andrey Ribeiro Guterres
    - Marcus Batista

Documentação
    - Bianca da Silva Aragão
    - Gustavo Dos Santos do Nascimento
    - Davi Serrão Lima
    - Gabriel Lobo
    - Matheus Lohan Pinheiro Furtado
    - Rodrigo De Oliveira Yoshioka

Design
    - Dan Cezar Ramos de Carvalho
    - Arthur Gonçalves Lopes
    - Maria Luiza Machado Rodrigues
    - Luiz Eduardo Martins de Souza
    - Alex Gonçalves da Silva Filho
""";

class PageSobre extends StatefulWidget {
  const PageSobre({super.key});
  final String rodapeTexto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at vestibulum nisl, in pellentesque erat. Nam non eleifend dolor, nec gravida mauris. ";

  @override
  State<PageSobre> createState() => _PageSobreState();
}

class _PageSobreState extends State<PageSobre> {
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
                      textSection(title: "Sobre", text: widget.rodapeTexto),
                      textSection(
                          image: "images/banner1.png",
                          title: "Nossa motivação",
                          text: widget.rodapeTexto + widget.rodapeTexto),
                      const SizedBox(height: 15),
                      sectionLogoExtensao(),
                      const SizedBox(height: 15),
                      textSection(title: "Equipe", text: EQUIPE),
                      const SizedBox(height: 100),
                    ]))
              ])
            ]))));
  }
}
