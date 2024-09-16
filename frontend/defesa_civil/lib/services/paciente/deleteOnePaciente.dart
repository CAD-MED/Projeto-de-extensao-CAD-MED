import 'package:Cad_Med/services/database/sqlHelper.dart';

Future deletePaciente({
  required SqfliteHelper dbHelper,
  required id,
}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();

  int res = await dbHelper.deleteUser(id);
  return res;
}
