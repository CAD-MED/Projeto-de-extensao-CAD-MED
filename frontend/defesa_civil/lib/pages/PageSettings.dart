import 'package:Cad_Med/components/buttonPersonalizado.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPage.dart';
import 'package:Cad_Med/messageAlerts/alerts.dart';
import 'package:Cad_Med/pages/PageEditeUser.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:flutter/material.dart';
import 'package:Cad_Med/services/exportDB/fetch.dart';

class Pagesettings extends StatefulWidget {
  const Pagesettings({super.key});

  @override
  State<Pagesettings> createState() => _PagesettingsState();
}

class _PagesettingsState extends State<Pagesettings> {
  final String rodapeTexto =
      "Explore as configurações para personalizar sua experiência e garantir que o CadMed continue a atender às suas necessidades de forma eficaz e segura.";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SqfliteHelper dbHelper = SqfliteHelper();
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
                      title: loading ? "Carregando dados" : "Configuração",
                      text: loading ? "" : rodapeTexto,
                    ),
                    const SizedBox(height: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loading
                            ? Container()
                            : buttonPersonalizado(
                                maxWidth: sMaxwidth,
                                onPressed: () {
                                  Navigator.of(context).push(
                                      SlideTransitionPage(
                                          page: PageEditeUser()));
                                },
                                text: "Editar cadastro"),
                        SizedBox(height: 15),
                        loading
                            ? Container()
                            : buttonPersonalizado(
                                maxWidth: sMaxwidth,
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  int response =
                                      await exportDatabase(dbHelper: dbHelper);
                                  print(response);

                                  if (response == 200 || response == 201) {
                                    alertSucessUp(context);
                                  } else {
                                    alertFailUp(context, response);
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                text: "Exportar banco de dados"),
                        !loading ? Container() : CircularProgressIndicator(),
                        const SizedBox(height: 100),
                      ],
                    )
                  ],
                ),
              )
            ]))));
  }
}
