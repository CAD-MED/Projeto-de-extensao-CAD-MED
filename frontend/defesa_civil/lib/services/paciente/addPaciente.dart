import 'package:Cad_Med/services/database/sqlHelper.dart';

Future addPaciente(
    {required SqfliteHelper dbHelper,
    required nome,
    required idade,
    required patologia,
    required genero}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();

  Map<String, dynamic> newUser = {
    'nome': nome,
    'idade': idade,
    'patologia': patologia,
    'genero': genero,
    'data_cadastro': DateTime.now().toIso8601String(),
  };

  int res = await dbHelper.insertUser(newUser);
  return res;
}
