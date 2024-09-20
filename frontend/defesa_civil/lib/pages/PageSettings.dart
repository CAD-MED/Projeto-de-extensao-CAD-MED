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
                            onPressed: () {
                              _showExportDialog(context);
                            },
                            text: "Exportar banco de dados"),
                        const SizedBox(height: 100),
                      ],
                    )
                  ],
                ),
              )
            ]))));
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Exportar Banco de Dados',
            style: TextStyle(color: Colors.green[800]),
          ),
          content: Text('Você deseja realmente exportar o banco de dados?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                foregroundColor: Colors
                    .white, // Alterado de "primary" para "foregroundColor"
              ),
              child: Text('Não', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                foregroundColor: Colors
                    .white, // Alterado de "primary" para "foregroundColor"
              ),
              child: Text('Sim', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a caixa de diálogo
                _showLoadingScreen(context); // Chama a função de loading
              },
            ),
          ],
        );
      },
    );
  }

  void _showLoadingScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Não permite fechar clicando fora
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                color: Colors.green,
              ),
              SizedBox(width: 20),
              Text("Carregando..."),
            ],
          ),
        );
      },
    );

    // Simula um atraso de 2 segundos para o loading
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Fecha a tela de loading
      // Aqui você pode adicionar a lógica de exportação do banco de dados
      // e mostrar uma mensagem de sucesso, se necessário.
    });
  }
}
