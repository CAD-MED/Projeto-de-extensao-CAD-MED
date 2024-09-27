import 'dart:convert';
import 'package:Cad_Med/services/paciente/getAllPaciente.dart';
import 'package:Cad_Med/services/user/getAllLogin.dart';
import 'package:http/http.dart' as http;
import 'package:Cad_Med/services/database/sqlHelper.dart';

Future<int> exportDatabase({required SqfliteHelper dbHelper}) async {
  try {
    // resgata os dados do meu login
    List<dynamic> user = await getAllLogin(dbHelper: dbHelper);
    // resgata os dados do meus pacientes
    List<dynamic> data = await getAllPacientes(dbHelper: dbHelper);
    List dataQuery = [];
    Map<String, dynamic> usuario = {
      'idUser': user[0]['nome'],
      'nome': '',
      'idade': '',
      'patologia': '',
      'genero': '',
    };

    for (var e in data) {
      usuario['nome'] = e['nome'];
      usuario['idade'] = e['idade'];
      usuario['patologia'] = e['patologia'];
      usuario['genero'] = e['genero'];
      dataQuery.add(usuario);
      usuario = {
        'idUser': user[0]['nome'],
        'nome': '',
        'idade': '',
        'patologia': '',
        'genero': '',
      };
    }
    Map<String, dynamic> bodyRequest = {
      "pacientes": dataQuery,
      "password": user[0]['senha']
    };
    var url =
        Uri.parse('https://cadmedunama.netlify.app/api/pacientes');
        
    // var body = json.encode({'usuarios': users});

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(bodyRequest),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  } catch (e) {
    return 500;
  }
}

Future exportDatabaseCopy({required SqfliteHelper dbHelper}) async {
  try {
    // resgata os dados do meu login
    List<dynamic> user = await getAllLogin(dbHelper: dbHelper);
    // resgata os dados do meus pacientes
    List<dynamic> data = await getAllPacientes(dbHelper: dbHelper);
    List dataQuery = [];
    Map<String, dynamic> usuario = {
      'idUser': user[0]['nome'],
      'nome': '',
      'idade': '',
      'patologia': '',
      'genero': '',
    };

    for (var e in data) {
      usuario['nome'] = e['nome'];
      usuario['idade'] = e['idade'];
      usuario['patologia'] = e['patologia'];
      usuario['genero'] = e['genero'];
      dataQuery.add(usuario);
      usuario = {
        'idUser': user[0]['nome'],
        'nome': '',
        'idade': '',
        'patologia': '',
        'genero': '',
      };
    }
    Map<String, dynamic> bodyRequest = {
      "pacientes": dataQuery,
      "password": user[0]['senha']
    };
    return json.encode(bodyRequest);
  } catch (e) {
    return "";
  }
}
