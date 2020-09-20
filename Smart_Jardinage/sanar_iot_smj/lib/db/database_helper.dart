import 'package:sanar_iot_smj/models/table.dart';
import 'package:sanar_iot_smj/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      print('Db exists');
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'main.db');
    var ourDb = openDatabase(path, version: 1, onCreate: _onCreate);
    print('Database opened');
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "Create Table User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    print('table User is created');
    await db.execute(
        "Create Table TableMJ(id INTEGER PRIMARY KEY, deviceId TEXT, tableName TEXT, cultureType TEXT)");
    print('table Table Micro jardinage is created');
  }

  Future<User> saveUser(User user) async {
    var dbClient = _db;
    user.id = await dbClient.insert("User", user.toMap());
    return user;
  }

  Future<TableJardin> saveTable(TableJardin tableMJ) async {
    var dbClient = _db;
    tableMJ.id = await dbClient.insert("TableMJ", tableMJ.toMap());
    return tableMJ;
  }
  // Requete par Device ID

// Requete pour ALL DEVICE

  Future<List<TableJardin>> getTables() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('TableMJ',
        columns: ['id', 'deviceId', 'tableName', 'cultureType']);
    List<TableJardin> tables = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        tables.add(TableJardin.map(maps[i])); //.fromMap(maps[i]));
      }
    }
    return tables;
  }

  // Requete pour ALL USER
  Future<List<User>> getUsers() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query('User', columns: ['id', 'username', 'password']);
    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        users.add(User.map(maps[i])); //.fromMap(maps[i]));
      }
    }
    return users;
  }

  Future <User> verify(String username, String password)async{
    var dbClient = await db;
    //var results = await dbClient.rawQuery('Select * from User where username=$username and password =$password');
    var results = await dbClient.rawQuery('Select * from User where username=$username and password = $password');
    if (results.length>0){
      return new User.map(results.first);
    }
    return null ; 
  }


// UPDATE USER  -ID

// UPDATE TABLE -TableName

// DELETE TABLE -TableName

// GET LASTS VALUES

// Faire attention supprimer par ID
/*Future<int> deleteTable(User user, ) async {
    var dbClient = _db;
    int res = await dbClient.delete("TableMJ");
    return res;
}*/

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTable(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'TableSMJ',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(User user) async {
    var dbClient = await db;
    return await dbClient.update(
      'User',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

}
