import 'package:Cad_Med/components/cardUser.dart';
import 'package:Cad_Med/components/header.dart';
import 'package:Cad_Med/components/textSection.dart';
import 'package:Cad_Med/effects/SlideTransitionPage.dart';
import 'package:Cad_Med/pages/PageEditar.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:Cad_Med/services/paciente/getAllPaciente.dart';
import 'package:flutter/material.dart';

class PageVisualizarCadastro extends StatefulWidget {
  const PageVisualizarCadastro({super.key});
  final String rodapeTexto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at vestibulum nisl, in pellentesque erat. Nam non eleifend dolor, nec gravida mauris. ";

  @override
  State<PageVisualizarCadastro> createState() => _PageVisualizarCadastroState();
}

class _PageVisualizarCadastroState extends State<PageVisualizarCadastro> {
  // Variável para verificar se os dados ainda estão sendo carregados
  bool isLoading = true;
  bool isEmptyData = false;
  List users = [];
  SqfliteHelper dbHelper = SqfliteHelper();

  @override
  void initState() {
    super.initState();
    // Carrega os dados ao iniciar a página
    loadData();
  }

  // Função para simular a obtenção de dados do banco de dados fake
  void loadData() async {
    try {
      users = await getAllPacientes(dbHelper: dbHelper); // Simulação de fetch
      print("carregando dados");
      print(users);
      if (users.isEmpty) {
        setState(() {
          isEmptyData = true;
          isLoading = false; // Define como falso ao concluir o carregamento
        });
      } else {
        setState(() {
          isLoading = false; // Define como falso ao concluir o carregamento
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Mesmo em caso de erro, para o carregamento
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double sMaxwidth = MediaQuery.of(context).size.width;
    double margem = 60.0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(child: CircularProgressIndicator()) // Mostra o loading
            : SingleChildScrollView(
                child: Column(
                  children: [
                    header(sMaxwidth),
                    Column(
                      children: [
                        SizedBox(
                          width: sMaxwidth - margem,
                          child: Column(
                            children: [
                              textSection(
                                title: "Visualizar dados",
                                text: widget.rodapeTexto,
                              ),
                              const SizedBox(height: 15),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: users.length, // Contagem de itens
                                itemBuilder: (context, index) {
                                  var user = users[index];
                                  return cardUser(
                                    width: sMaxwidth,
                                    nome: user['nome']!,
                                    id: user['id']!,
                                    patologia: user['patologia']!,
                                    onTap: () {
                                      Navigator.of(context).push(
                                        SlideTransitionPage(
                                          page: PageEditar(
                                            userId: user['id']!,
                                          ),
                                        ),
                                      );
                                      // Ação ao clicar no card
                                      print(
                                          'Clicou no usuário ${user['nome']}');
                                    },
                                  );
                                },
                              ),
                              isEmptyData
                                  ? Column(
                                      children: [
                                        SizedBox(height: 150),
                                        Center(
                                          child: Text("Nada ainda cadastrado"),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
