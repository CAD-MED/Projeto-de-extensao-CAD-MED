import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void alertSucess(BuildContext context) {
  const snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Cadastrado com sucesso',
      message:
          'Tudo certo, seu cadastro foi um sucesso. Continue aproveitando o app!',
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void alertFailField(BuildContext context) {
  const snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Opps, algo errado',
      message: 'Falha, Verifique se campos estão preenchidos.',
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
