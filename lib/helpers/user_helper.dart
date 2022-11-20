import 'dart:io';
import 'package:ecolinky/services/http_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ecolinky/Models/user_model.dart';

// criando o nosso helper
// camada de persistência
class UserHelper {
  final String databaseName = "ecolinky.db"; // nome da base
  final int databaseVersion = 2; // versão da base
  late Database db; // variável que representa o banco

  // inicializa o banco de dados
  open() async {
    Directory dbDir = await getApplicationDocumentsDirectory();
    String dbPath = join(dbDir.path, databaseName);
    db = await openDatabase(dbPath,
        version: databaseVersion, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY autoincrement, name TEXT, cpf TEXT, email TEXT, password TEXT)");
    await db.execute(
        "insert into user(name, cpf, email, password) values('ecolinky', '222.222.222-22', 'contato@linkytech.com', 'linkytech')");
  }

  // insere o usuário
  Future<int> saveUser(User u) async {
    var resApi = await HttpService.createUser(u);
    print(u);
    var dbClient = await db;
    int res = await dbClient.insert("user", u.toMap());
    return res;
  }

  Future<bool> updateUser(User u) async {
    var dbClient = await db;
    int res = await dbClient
        .update("user", u.toMap(), where: "id = ?", whereArgs: [u.id]);
    return res > 0 ? true : false;
  }

  Future<bool> deleteUser(User u) async {
    var dbClient = await db;
    int res = await dbClient.
    // $1, :email
    rawDelete("delete from user where id = ?", [u.id]);
    return res > 0 ? true : false;
  }

  // validar login
  Future<User?> validateLogin(String email, String password) async {
    var dbClient = await db;
    User? user; // preenche os dados do usuário
    List<Map> list = await dbClient.rawQuery(
        "select * from user where email = ? and password = ?",
        [email, password]);
    if (list.length > 0) {
      user = User(list[0]["id"],
          list[0]["name"],
          list[0]["cpf"],
          list[0]["email"],
          list[0]["password"]
      );
    };

    return user;
  }
}