import 'package:ap_explore/model/users.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();
  static Database? _database;
  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("swistol.db");
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const boolType = "BOOLEAN NOT NULL";
    const textType = "TEXT NOT NULL";
    const integerType = "INTEGER";

    await db.execute("""
    CREATE TABLE $usersTable(
      ${UsersFields.idProy} $integerType,
      ${UsersFields.password} $textType,
      ${UsersFields.iid} $integerType,
      ${UsersFields.idCliente} $integerType,
      ${UsersFields.user} $textType,
      ${UsersFields.id} $idType,
      ${UsersFields.iStatus} $boolType)
      """);
  }

  Future createUser(user) async {
    final db = await instance.database;
    return await db.insert(usersTable, user);
  }

  Future deleteAllUsers() async {}

  Future readUser(username, password) async {
    final db = await instance.database;
    return await db.query(
      usersTable,
      columns: [
        UsersFields.user,
        UsersFields.password,
      ],
      where: "${UsersFields.user} = ?",
      whereArgs: [
        username,
      ],
    );
    // return List<Map<String, dynamic>>.generate(
    //     result.length, (index) => Map<String, dynamic>.from(result[index]));
  }
}
