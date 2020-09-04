import 'package:sanar_iot_smj/models/table.dart';
import 'package:sanar_iot_smj/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static final DatabaseHelper _instance= new DatabaseHelper.internal();
  DatabaseHelper.internal();
  factory DatabaseHelper()=> _instance;

  static Database _db;
  Future <Database> get db async{
    if (_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'main.db');
    var ourDb = openDatabase(path,
    version: 1,onCreate: _onCreate);
  }

  void _onCreate(Database db , int version) async{
    await db.execute("Create Table User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    print('table User is created');
    await db.execute("Create Table TableMJ(id INTEGER PRIMARY KEY, deviceId TEXT, tableName TEXT, cultureType TEXT)");
    print('table Table Micro jardinage is created');

  }

  Future<int> saveUser(User user) async {
    var dbClient = _db;
    int res = await dbClient.insert("User",user.toMap());
    return res;
  }

  Future<int> saveTable(Table tableMJ) async {
    var dbClient = _db;
    int res = await dbClient.insert("TableMJ",tableMJ.toMap());
    return res;
  }
    // Requete par Device ID

    // Requete pour ALL DEVICE

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


}