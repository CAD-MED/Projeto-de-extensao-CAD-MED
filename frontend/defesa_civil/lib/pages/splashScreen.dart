import 'package:Cad_Med/pages/PageInicio.dart';
import 'package:Cad_Med/pages/PageInit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adiciona um atraso de 3 segundos
    Future.delayed(const Duration(seconds: 4), () {
      // Navega para a próxima tela após 3 segundos
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PageInicio()), // Substitua pela sua próxima tela
      );
    });
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
                                    color: Colors
                                        .white, // Cor do indicador de carregamento
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