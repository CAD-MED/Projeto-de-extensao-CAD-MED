import 'package:Cad_Med/services/database/sqlHelper.dart';

Future<int> addUser(
    {required SqfliteHelper dbHelper,
    required nome,
    required posto,
    required senha}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();
  Map<String, String> User = {
    "nome": nome,
    "posto": posto,
    "senha": senha,
  };
  print(User);
  int res = await dbHelper.insertLogin(User);

  // Retorna uma lista de mapas simulando os dados do banco de dados
  return res;
}
