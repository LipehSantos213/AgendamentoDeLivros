import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:agenda_de_livros/models/LoginModel.dart';

class DbHelper {
  // CLASSE PARA GERENCIAR TODAS AS OPERAÇOES DO BANCO SQLite
  static Database? _database;
  static final int version = 1;
  static final String _databaseName = "meubd.db";

  // CONSTRUTOR PRIVADO PARA GARANTIR UMA UNICA INSTANCIA
  DbHelper.privateConstrutor();
  static final DbHelper instance = DbHelper.privateConstrutor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  // Inicializando o BD
  Future<Database> initDatabase() async {
    Directory documentsDiretory = await getApplicationDocumentsDirectory();
    String path = join(documentsDiretory.path, _databaseName);
    return await openDatabase(path, version: version, onCreate: onCreate);
  }

  // Criando as tabelas do BD
  Future onCreate(Database db, int version) async {
    String script = '''
    CREATE TABLE conta (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL

    )
''';
    await db.execute(script);
  }

  // CRUD
  Future<int> insertUser(LoginModel login) async {
    Database db = await instance.database;
    return await db.insert("conta", login.toMap());
  }

  Future<List<LoginModel>> getUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      "conta",
    ); // pega todos os registros da tabela
    return List.generate(
      maps.length,
      (index) => LoginModel.fromJson(maps[index]),
    );
  }

  Future<LoginModel?> getUserById(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      "conta",
      where: "id  = ?",
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return LoginModel.fromJson(maps.first);
    }
    return null;
  }

  Future<int> updateUser(LoginModel login) async {
    Database db = await instance.database;
    return await db.update(
      "conta",
      login.toMap(),
      where: "id = ?",
      whereArgs: [login.id],
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete("conta", where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteAllUsers() async {
    Database db = await instance.database;
    return await db.delete("conta");
  }

  Future<void> closeDB() async {
    Database db = await instance.database;
    db.close();
    _database = null; // Garante que a próxima chamada inicialize um novo DB
  }
}
