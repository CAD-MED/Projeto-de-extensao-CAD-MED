import 'package:Cad_Med/services/database/sqlHelper.dart';

Future<List> getAllPacientes({required SqfliteHelper dbHelper}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();

  List data = await dbHelper.getAllUsers();

  // Retorna uma lista de mapas simulando os dados do banco de dados
  return data;
}
