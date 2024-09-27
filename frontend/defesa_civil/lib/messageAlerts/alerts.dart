import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void alertSucessDelete(BuildContext context) {
  const snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Cadastro deletado com sucesso',
      message: 'Tudo certo. Continue aproveitando o app!',
      contentType: ContentType.success,
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void alertSucessUpdate(BuildContext context) {
  const snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Atualizado com sucesso',
      message:
          'Tudo certo, seu cadastro foi atualizado. Continue aproveitando o app!',
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

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

void alertSucessCopy(BuildContext context) {
  const snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'dados copiados com sucesso',
      message:
          'Tudo certo, os dados dos pacientes foram copiados para sua area de transferencia. Continue aproveitando o app!',
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void alertSucessUp(BuildContext context) {
  const snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'dados carregados na nuvem',
      message:
          'Tudo certo, seus dados foram salvos com sucesso. Continue aproveitando o app!',
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void alertFailUp(BuildContext context, code) {
  SnackBar snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Opps, algo errado',
      message:
          'Erro ao carregar os dados, seus dados não foram salvos. error $code',
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
