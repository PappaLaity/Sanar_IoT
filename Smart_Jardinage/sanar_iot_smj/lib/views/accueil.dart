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

class Accueil extends StatefulWidget {
  @override
  AcceuilState createState() => AcceuilState();
}

class AcceuilState extends State<Accueil> {

  // Recuperer a la DB la liste des tables
  
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
  ];

  Future<List<Table>> tablesculture;
  DatabaseHelper dbhelper= DatabaseHelper();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: Icon(Icons.local_florist,
        size:36,
        color: Colors.black,),
          title: Text('SMART MICRO JARDINAGE',
              style: TextStyle(fontFamily: 'Monserrat', fontSize: 20.0)),
          /*actions: <Widget>[
            IconButton(icon: Icon(Icons.add,color: Colors.black,size: 36.0,),
          onPressed: (){Navigator.of(context).pushReplacementNamed('/addTable');},)
          ],*/
        ),
        body:
            ListView.builder(
            itemCount: ListTable.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/table');
                          },
                          title: Text('Table ${index}'),
                          subtitle: Text(
                              'Culture de ' + ListTable[index]['Type Culture']),
                          leading: Icon(Icons.touch_app),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).pushNamed('/addTable');
        },
        child:Icon(Icons.add,size: 36.0,color: Colors.white,),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
