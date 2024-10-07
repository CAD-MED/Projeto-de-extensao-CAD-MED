import 'package:Cad_Med/services/database/sqlHelper.dart';

Future updatePaciente(
    {required SqfliteHelper dbHelper,
    id,
    nome,
    idade,
    patologia,
    genero}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();

  Map<String, String> User = {
    'nome': nome,
    'idade': idade,
    'patologia': patologia,
    'genero': genero,
  };

  int res = await dbHelper.updateUser(id, User);
  return res;
}
