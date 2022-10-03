import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:teste/data/login_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'user.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(LoginDao.tableSql);
  }, version: 1,);
}