import 'package:ap_explore/model/users.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();
  static Database? _database;
  UsersDatabase._init();

  // initiates the database if doesnt exists
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("swistol.db");
    return _database!;
  }

  // sets the path to create the database
  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  // this function is fired when creating the db for the users table
  Future _onCreateDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const boolType = "BOOLEAN NOT NULL";
    const textType = "TEXT NOT NULL";
    const integerType = "INTEGER";

    // executes the create table sql
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

  // users table is created and returns a map of the created user
  Future createUser(user) async {
    final db = await instance.database;
    return await db.insert(usersTable, user);
  }

  Future deleteAllUsers() async {}

  // a function to get a user from the database if it exists
  Future readUser(username, password) async {
    final db = await instance.database;
    // returns a map if the exists and returns null if not
    return await db.query(
      usersTable,
      // columns is the tables to query in the db
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
