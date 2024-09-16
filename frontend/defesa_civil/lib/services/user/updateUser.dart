import 'package:Cad_Med/services/database/sqlHelper.dart';

Future<int> updateUser(
    {required SqfliteHelper dbHelper,
    required id,
    required nome,
    required posto,
    required senha}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();
  Map<String, dynamic> User = {
    "nome": nome,
    "posto": posto,
    "senha": senha,
  };
  int res = await dbHelper.updateLogin(id, User);

  // Retorna uma lista de mapas simulando os dados do banco de dados
  return res;
}
