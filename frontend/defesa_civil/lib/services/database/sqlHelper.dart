import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  static final SqfliteHelper _instance = SqfliteHelper._internal();
  factory SqfliteHelper() => _instance;

  static Database? _database;

  SqfliteHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Criando a tabela de usuários
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        idade INTEGER,
        patologia TEXT,
        genero TEXT,
        data_cadastro TEXT
      )
    ''');

    // Criando a tabela de logins
    await db.execute('''
      CREATE TABLE logins(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        posto TEXT,
        senha TEXT
      )
    ''');
  }

  // CRUD para Tabela "users"
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query('users');
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db.query('users', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> updateUser(int id, Map<String, dynamic> user) async {
    final db = await database;
    return await db.update('users', user, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // CRUD para Tabela "logins"
  Future<int> insertLogin(Map<String, dynamic> login) async {
    final db = await database;
    return await db.insert('logins', login);
  }

  Future<List<Map<String, dynamic>>> getAllLogins() async {
    final db = await database;
    return await db.query('logins');
  }

  Future<Map<String, dynamic>?> getLoginById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db.query('logins', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> updateLogin(int id, Map<String, dynamic> login) async {
    final db = await database;
    return await db.update('logins', login, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteLogin(int id) async {
    final db = await database;
    return await db.delete('logins', where: 'id = ?', whereArgs: [id]);
  }

  queryAllRows() {}
}
