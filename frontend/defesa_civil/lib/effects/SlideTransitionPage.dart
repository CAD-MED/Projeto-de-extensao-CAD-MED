import 'package:flutter/material.dart';

class SlideTransitionPage extends PageRouteBuilder {
  final Widget page;

  SlideTransitionPage({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Início fora da tela (à direita)
            const end = Offset(0.0, 0.0); // Final no centro da tela
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
