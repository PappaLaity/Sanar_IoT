/**
 * Nom Proprio
 * Liste des Tables
 * Acces Reglages
 * Deconnexion
 */
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sanar_iot_smj/db/database_helper.dart';
import 'package:sanar_iot_smj/models/table.dart';
import 'package:sanar_iot_smj/views/tableJardin.dart';

class Accueil extends StatefulWidget {
  @override
  AcceuilState createState() => AcceuilState();
}

class AcceuilState extends State<Accueil> {
  // Recuperer a la DB la liste des tables
/*
  List ListTable = [
    {
      'Nom': 'Table 1',
      'Type Culture': 'Carotte',
      'Data': {'Tmp': '38', 'HM': '68', 'SM': '78', 'ST': '32'}
    },
    {
      'Nom': 'Table 2',
      'Type Culture': 'Chou',
      'Data': {'Tmp': '38', 'HM': '68', 'SM': '74', 'ST': '30'},
    },
    {
      'Nom': 'Table 3',
      'Type Culture': 'Navet',
      'Data': {'Tmp': '34', 'HM': '70', 'SM': '82', 'ST': '29'}
    }
  ];*/

  List<TableJardin> tablesculture = [];
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  String erreur = "";
  String success = "";

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    refreshTableList();
    erreur = '';
  }

  refreshTableList() {
    tablesculture.clear();
    final listTables = dbHelper.queryAllRows();
    listTables.then((onValue) {
      setState(() {
        if (onValue.length != 0) {
          for (var i = 0; i < onValue.length; i++) {
            var data = onValue[i];
            tablesculture.add(TableJardin.map(data));
          }
        }
      });
    }).catchError((onError) {});
  }

  void _deleteTable(tableId) {
    
    final rowsDeleted =  dbHelper.deleteTable(tableId);

    print('rows $rowsDeleted is deleted ');

    this.refreshList();
     
  }

  Future<void> refreshList() {
    final listTables = dbHelper.queryAllRows();
    tablesculture.clear();
    listTables.then((onValue) {
      setState(() {
        if (onValue.length != 0) {
          for (var i = 0; i < onValue.length; i++) {
            var data = onValue[i];
            tablesculture.add(TableJardin.map(data));
          }
        }
      });
    }).catchError((onError) {});
    //return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.local_florist,
          size: 36,
          color: Colors.black,
        ),
        title: Text('SMART MICRO JARDINAGE',
            style: TextStyle(fontFamily: 'Monserrat', fontSize: 20.0)),
        /*actions: <Widget>[
            IconButton(icon: Icon(Icons.add,color: Colors.black,size: 36.0,),
          onPressed: (){Navigator.of(context).pushReplacementNamed('/addTable');},)
          ],*/
      ),
      body: RefreshIndicator(
          onRefresh: refreshList,
          child: ListView.builder(
            itemCount: tablesculture.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                          onTap: () {
                            //Navigator.of(context).pushNamed('/table',);
                            //Navigator.push(context, route)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new TableJardinClass(
                                        devicesId:
                                            tablesculture[index].tableDevices,
                                        tableName:
                                            tablesculture[index].tableName,
                                      )),
                            );
                          },
                          title: Text('Table ${index}'),
                          subtitle: Text('Culture de ' +
                              tablesculture[index].tableCulture),
                          leading: Icon(Icons.touch_app),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteTable(tablesculture[index].tableId);
                            },
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addTable');
        },
        child: Icon(
          Icons.add,
          size: 36.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _AllTables() async {
    final allRows = await dbHelper.queryAllRows();
    tablesculture.clear();

    allRows.forEach((row) => print(row));

    // allRows.forEach((row) => tablesculture.add(TableJardin.map(row)));

    print('Query done.');
    setState(() {});
  }
}
