/**
 * Nom Proprio
 * Liste des Tables
 * Acces Reglages
 * Deconnexion
 */
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Accueil extends StatefulWidget {
  @override
  AcceuilState createState() => AcceuilState();
}

class AcceuilState extends State<Accueil> {
  /*static String device = "b827ebfbd8ad_15";
  static String urlDevices =
      "https://api.waziup.io/api/v2/devices/"+device;
  List data;
  Future<String> getJsonData() async {
    //var response = '';
      var response = await http.get(
        Uri.encodeFull(urlDevices),
        headers: {"Accept": "application/json"}
      );

      print(response.body);
      setState((){
          var convertDataToJson =jsonDecode(response.body);// JSON.decode(response.body);
          data = convertDataToJson['sensors'];
      });

    return "success"; 
  }

  @override
  void initeState() {
    super.initState();
    this.getJsonData();
  }*/

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//        backgroundColor: Colors.brown,
          title: Text('SMART MICRO JARDINAGE',
              style: TextStyle(fontFamily: 'Monserrat', fontSize: 20.0)),
          actions: <Widget>[
            /*IconButton(icon: Icon(Icons.camera_alt),
          onPressed: (){},)*/
          ],
        ),
        body:
            /*new Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Table Alpha',style: TextStyle(),),
              subtitle: Text('table de culture de Carotte'),
              leading: Icon(Icons.mode_edit),
              contentPadding: EdgeInsets.all(10.0),
              onTap: (){
                
              },
            )
          ],
        ),
      ),*/
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
        ));
  }
}
