

import 'package:sqflite/sqflite.dart';
import 'package:teste/Components/user.dart';
import 'package:teste/data/database.dart';

class LoginDao {
  static const String _tableName = 'users';
  static const String _name = 'name';
  static const String _password = 'password';
  static const String _email = 'email';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT ,'
      '$_password TEXT, '
      '$_email TEXT)';

  Map<String, dynamic> toMap(User user) {
    final Map<String, dynamic> usersMap = Map();

    usersMap[_name] = user.name;
    usersMap[_password] = user.password;
    usersMap[_email] = user.email;
    return usersMap;
  }

  List<User> toList(List<Map<String, dynamic>> userMap) {
    final List<User> users = [];
    for (Map<String, dynamic> line in userMap) {
      final User user = User(line[_name], line[_password], line[_email]);
      users.add(user);
    }
    return users;
  }

  save(User user) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(user.name);
    Map<String, dynamic> userMap = toMap(user);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(_tableName, userMap);
    } else {
      return await bancoDeDados.update(
        _tableName,
        userMap,
        where: '$_name = ?',
        whereArgs: [user.name],
      );
    }
  }

  Future<List<User>> find(String userName) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [userName],
    );
    return toList(result);
  }

  delete() async {}
}