import 'dart:io';
import 'package:agenda_de_livros/models/LivroModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:agenda_de_livros/models/UserModel.dart';

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
    // Ativa o uso de chaves estrangeiras
    await db.execute('PRAGMA foreign_keys = ON');
    String script = '''
    CREATE TABLE conta (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      usuario TEXT NOT NULL,
      email TEXT NOT NULL,
      senha TEXT NOT NULL
    );
    CREATE TABLE livro (
      idLivro INTEGER PRIMARY KEY AUTOINCREMENT
      titulo TEXT NOT NULL,
      autor TEXT NOT NULL,
      palavraChave TEXT,
      genero TEXT NOT NULL,
      quantidade INTEGER NOT NULL,
      editora TEXT NOT NULL,
      anoPublicacao TEXT NOT NULL,
      numeroPaginas INTEGER NOT NULL,
      edicao TEXT NOT NULL, 
      idioma TEXT NOT NULL,
      descricao TEXT NOT NULL,
      localizacao TEXT NOT NULL,
      idConta INTEGER NOT NULL,
      FOREIGN KEY (idConta) REFERENCES conta(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    );
    CREATE TABLE livroExemplar (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      isbn TEXT NOT NULL,
      numeroExemplar INTEGER NOT NULL,
      status TEXT,
      idLivro INTEGER NOT NULL,
      FOREIGN KEY (idLivro) REFERENCES livro(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    );

    CREATE TABLE leitor (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      sobrenome TEXT NOT NULL,
      telefone TEXT NOT NULL,
      email TEXT NOT NULL,
      rua TEXT NOT NULL,
      bairro TEXT NOT NULL,
      cep TEXT NOT NULL,
      cidade TEXT NOT NULL,
      dataNascimento TEXT NOT NULL,
    );
    CREATE TABLE emprestimo (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      nomePessoa TEXT NOT NULL,
      livroEmprestado TEXT NOT NULL,
      dataEmprestimo TEXT NOT NULL,
      dataDevolucaoPrevista TEXT NOT NULL,
      dataDevolucaoEfetiva TEXT,
      devolvido INTEGER NOT NULL,
      obseracoes TEXT,
      status TEXT NOT NULL,
      idExemplar INTEGER NOT NULL,
      idLeitor INTEGER NOT NULL,  
      FOREIGN KEY (idExemplar) REFERENCES livroExemplar(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
      FOREIGN KEY (idLeitor) REFERENCES leitor(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    );

    
    
    
''';
    await db.execute(script);
  }

  // CRUD
  Future<int> insertLivro(LivroModel livro) async {
    Database db = await instance.database;
    return await db.insert("livro", livro.toMap());
  }

  Future<List<LivroModel>> getLivros() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> mapLivros = await db.query("livro");
    return List.generate(
      mapLivros.length,
      (index) => LivroModel.fromJson(mapLivros[index]),
    );
  }

  Future<String> insertUser(UserModel login) async {
    final db = await instance.database;

    // Verifica se o e-mail já está cadastrado
    final existingUser = await db.query(
      "conta",
      where: "email = ?",
      whereArgs: [login.email],
    );

    if (existingUser.isNotEmpty) {
      // Retorna um código que o app pode interpretar
      // 0 é mail duplicado
      return "Usuario com o Email ja Cadastrado";
    }

    // Insere o usuário com segurança
    await db.insert(
      "conta",
      login.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    return "Usuario criado com sucesso !!!";
  }

  Future<bool> accessAccount(UserModel login) async {
    final db = await instance.database;
    final existingUser = await db.query(
      "conta",
      where: "usuario = ? AND email = ? AND senha = ?",
      whereArgs: [login.usuario, login.email, login.senha],
    );
    if (existingUser.isNotEmpty) {
      // Usuario existente
      return true;
      // return "Seja Bem vindo de Volta ${login.usuario}";
    } else {
      // Usuario invalido
      return false;
      // return "Credenciais Invalidas !!!";
    }
  }

  Future<List<UserModel>> getUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      "conta",
    ); // pega todos os registros da tabela
    return List.generate(
      maps.length,
      (index) => UserModel.fromJson(maps[index]),
    );
  }

  Future<UserModel?> getUserById(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      "conta",
      where: "id  = ?",
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    }
    return null;
  }

  Future<int> updateUser(UserModel login) async {
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
