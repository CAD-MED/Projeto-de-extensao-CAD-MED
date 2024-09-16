// Simulação de banco de dados fake
import 'package:Cad_Med/services/database/sqlHelper.dart';

Future<Map<String, dynamic>> getpacienteById(
    {required SqfliteHelper dbHelper, required userId}) async {
  // SqfliteHelper dbHelper = SqfliteHelper();
  dynamic res = await dbHelper.getUserById(userId);
  // await Future.delayed(Duration(seconds: 2)); // Simula o tempo de espera
  // Simulando uma tabela de usuários com dados

  // Buscando o usuário pelo ID
  return res;
}
