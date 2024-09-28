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
    - Marcus Paulo Da Silva Batista
    - João Vitor Ramos Soares

Documentação
    - Bianca da Silva Aragão
    - Gabriel Lobo Baia
    - Sean Max de Oliveira Pinheiro
    - Davi Serrão Lima
Design
    - Marco Antonio
    - Rafael Góes Duarte
    - Maria Luiza Machado Rodrigues
    - Vinicius Matheus Ramos das Merces
""";

class PageSobre extends StatefulWidget {
  const PageSobre({super.key});
  final String rodapeTexto =
      "O CadMed é um aplicativo móvel desenvolvido para transformar a forma como registramos e gerenciamos as pessoas atendidas pelos postos da Defesa Civil. Feito especialmente para enfrentar os desafios do Círio de Nazaré. Buscando tornar o atendimento mais eficiente e seguro.";

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
                          text:
                              "Com o CadMed, estamos construindo um futuro onde a tecnologia se alia ao compromisso com a segurança e o bem-estar da comunidade. Cada clique, cada registro, cada dado digitalizado é um passo em direção a um atendimento mais ágil e humano.\n\nVamos juntos transformar a maneira como a Defesa Civil atende, registrando e gerenciando, e fazendo com que cada evento seja uma oportunidade para oferecer o melhor suporte possível."),
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
