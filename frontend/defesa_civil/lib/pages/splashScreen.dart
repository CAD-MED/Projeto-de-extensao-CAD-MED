import 'package:Cad_Med/effects/SlideTransitionPage.dart';
import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:Cad_Med/pages/PageInit.dart';
import 'package:Cad_Med/services/database/sqlHelper.dart';
import 'package:Cad_Med/services/user/getAllLogin.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SqfliteHelper dbHelper = SqfliteHelper();
  List userData = [];

  @override
  void initState() {
    super.initState();
    _requestPermissions(); // Solicita as permissões de armazenamento e rede

    // Busca dados do login no banco de dados
    getAllLogin(dbHelper: dbHelper).then((data) {
      setState(() {
        userData = data;
      });
    });

    // Adiciona um atraso de 4 segundos para simular a splash screen
    Future.delayed(const Duration(seconds: 4), () {
      // Verifica se há dados de login e navega para a tela correta
      if (userData.isNotEmpty) {
        Navigator.of(context)
            .pushReplacement(SlideTransitionPage(page: PageInicio()));
      } else {
        Navigator.of(context)
            .pushReplacement(SlideTransitionPage(page: PageInit()));
      }
    });
  }

  // Método para solicitar permissões
  Future<void> _requestPermissions() async {
    // Solicita permissões de armazenamento (READ e WRITE)
    if (await _hasStoragePermission() == false) {
      await Permission.storage.request();
    }

    // Se o dispositivo é muito antigo, pode solicitar permissões adicionais aqui, se necessário.
  }

  // Verifica se já possui permissão de armazenamento
  Future<bool> _hasStoragePermission() async {
    var status = await Permission.storage.status;
    return status.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/walpaper.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: largura - 100,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(.7)),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Image(image: AssetImage("images/logoFrame.png")),
                          SizedBox(height: 40),
                          Center(
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))),
                          SizedBox(height: 50),
                        ])),
                const SizedBox(height: 20),
                Container(
                  width: largura - 100,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(.7)),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      sectionLogoExtensao(),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
