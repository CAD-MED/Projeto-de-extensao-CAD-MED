import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Cad_Med/services/database/sqlHelper.dart';

class FetchService {
  final SqfliteHelper dbHelper;

  FetchService({required this.dbHelper});

  Future<List<Map<String, dynamic>>> getAllPacientes() async {
    try {
      final List<Map<String, dynamic>> ´users = await dbHelper.queryAllRows();
      return users;
    } catch (e) {
      print("Erro ao buscar pacientes: $e");
      return [];
    }
  }

  Future<void> exportDatabase(List<Map<String, dynamic>> users) async {
    try {
      var url = Uri.parse('https://');
      var body = json.encode({'usuarios': users});

      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print("Dados exportados com sucesso!");
      } else {
        print("Falha ao exportar dados. Código: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao exportar dados: $e");
    }
  }
}
