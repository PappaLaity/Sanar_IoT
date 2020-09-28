import 'package:sanar_iot_smj/models/table.dart';
import 'package:sanar_iot_smj/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  
  static final _databaseName = "jardin.db";
  static final _databaseVersion = 1;
 
  static final tableJardin = 'tableJardin';
 
  static final tableId = 'tableId';
  static final tableDevices='tableDevices';
  static final tableName='tableName';
  static final tableCulture = 'tableCulture';

    // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor(); 

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
    String path = join(documentDirectory.path, _databaseName);

    return await  openDatabase(path, 
                              version: _databaseVersion,
                              
                              onCreate: _onCreate);
  
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "Create Table User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    print('table User is created');
    await db.execute(
        "Create Table $tableJardin(tableId INTEGER PRIMARY KEY, tableName TEXT, tableDevices TEXT,tableCulture TEXT)");
    print('table Table Micro jardinage is created');
  }

  Future<User> saveUser(User user) async {
    var dbClient = _db;
    user.id = await dbClient.insert("User", user.toMap());
    return user;
  }

  Future<int> insertTable(TableJardin tableMJ) async {
    Database database = await instance.db;
    
    return await database.insert(tableJardin, tableMJ.toMap());
    
  }

  //All Tables 
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database database = await instance.db;
    return await database.query(tableJardin);
  } 

  //Devices of A table
  Future<TableJardin> getDevices(int tableId) async {
    var dbClient = await db;

    List<Map> maps = await dbClient.query(tableJardin,
        columns: ['tableDevices'],
        where: 'tableId = ?',
        whereArgs: [tableId]
        );

    if (maps.length > 0) {
      return new TableJardin.map(maps.first);
    }
    return null;
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
    
    var results = await dbClient.rawQuery('Select * from User where username=$username and password = $password');
    if (results.length>0){
      return new User.map(results.first);
    }
    return null ;
  }


  //delete User
  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  // Delete Table
  Future<int> deleteTable(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableJardin,
      where: 'tableId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateTab(TableJardin tab) async{
    var database = await instance.db;
    int id = tab.toMap()['tableId'];
   return await database.update(tableJardin, tab.toMap(), where :'tableId = ?', whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
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
