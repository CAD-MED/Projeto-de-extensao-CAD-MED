import 'package:Cad_Med/components/cardUser.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:flutter/material.dart';

class PageVisualizarCadastro extends StatefulWidget {
  const PageVisualizarCadastro({super.key});
  final String rodapeTexto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at vestibulum nisl, in pellentesque erat. Nam non eleifend dolor, nec gravida mauris. ";

  @override
  State<PageVisualizarCadastro> createState() => _PageVisualizarCadastroState();
}

class _PageVisualizarCadastroState extends State<PageVisualizarCadastro> {
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
                          title: "Visualizar dados", text: widget.rodapeTexto),
                      const SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap:
                            true, // Permite que o ListView se ajuste ao conteúdo
                        physics:
                            NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView, já que o SingleChildScrollView está no controle
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return cardUser(width: sMaxwidth, onTap: () {});
                        },
                      ),
                      const SizedBox(height: 20),
                    ]))
              ])
            ]))));
  }
}
