import 'package:Cad_Med/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

// void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//   runApp(
//     DevicePreview(
//       enabled: true, // Ativa o DevicePreview
//       builder: (context) => MyApp(),
//     ),
//   );
//   FlutterNativeSplash.remove(); // Remove a splash screen após inicialização
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true, // Necessário para o DevicePreview funcionar
//       locale: DevicePreview.locale(
//           context), // Suporta localizações no DevicePreview
//       builder: DevicePreview
//           .appBuilder, // Configura o construtor para o DevicePreview
//       home: SplashScreen(),
//     );
//   }
// }
