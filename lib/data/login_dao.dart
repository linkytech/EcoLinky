import 'package:sqflite/sqflite.dart';
import 'package:teste/data/database.dart';
import 'package:teste/Models/user_model.dart';

class LoginDao {
  static const String _tableName = 'userTable';
  static const String _name = 'name';
  static const String _password = 'password';
  static const String _email = 'email';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_password TEXT, '
      '$_email TEXT)';

  save(User usuario) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(usuario.name);
    Map<String, dynamic> userMap = toMap(usuario);
    if (itemExists.isEmpty) {
      print(itemExists.isEmpty);
      return await bancoDeDados.insert(_tableName, userMap);
    } //else {
    //   return await bancoDeDados.update(
    //     _tableName,
    //     userMap,
    //     where: '$_name = ?',
    //     whereArgs: [usuario.name],
    //   );
    }
  }

  Map<String, dynamic> toMap(User usuario) {
    final Map<String, dynamic> mapaDeUsuarios = Map();

    mapaDeUsuarios[_name] = usuario.name;
    mapaDeUsuarios[_email] = usuario.email;
    mapaDeUsuarios[_password] = usuario.password;

    return mapaDeUsuarios;
  }

  Future<List<User>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tableName);
    return toList(result);
  }

  List<User> toList(List<Map<String, dynamic>> mapaDeUsuarios) {
    final List<User> usuarios = [];
    for (Map<String, dynamic> linha in mapaDeUsuarios) {
      final User usuario = User(linha[_name], linha[_email], linha[_password]);
      usuarios.add(usuario);
    }
    return usuarios;
  }

  Future<List<User>> find(String nomeDoUsuario) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDoUsuario],
    );
    return toList(result);
  }

  // delete(String nomeDoUsuario) async {
  //   final Database bancoDeDados = await getDatabase();
  //   return bancoDeDados.delete(
  //     _tableName,
  //     where: '$_name = ?',
  //     whereArgs: [nomeDoUsuario],
  //   );
  // }
}