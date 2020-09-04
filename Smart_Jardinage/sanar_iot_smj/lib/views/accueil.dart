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

  // Recuperer a la DB la liste des tables
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

  /*var Listable2 = {
    "gateway_id":"b827ebfbd8ad",
    "date_modified":"2020-08-17T18:09:43Z",
    "owner":"pappalaity@gmail.com",
    "name":"b827ebfbd8ad_15",
    "id":"b827ebfbd8ad_15",
    "sensors":[
      {"value":
        {"date_received":"2020-08-17T18:09:04Z","value":859,"timestamp":"2020-07-24T17:01:56Z"},
        "name":"HA",
        "id":"HA"
      },
      {"value":{
        "date_received":"2020-08-17T18:09:19Z",
        "value":32,
        "timestamp":"2020-08-17T18:08:00Z"
      },
        "name":"HM",
        "id":"HM"
      },
      {"value":{"date_received":"2020-08-17T18:09:43Z","value":868,"timestamp":"2020-08-17T18:07:00Z"},"name":"SM","id":"SM"
      },
      {"value":{
        "date_received":"2020-08-17T18:09:04Z",
        "value":26,
        "timestamp":"2020-08-17T18:07:36Z"
      },
        "name":"TC",
        "id":"TC"
      }
      ],
    "actuators":[],
    "date_created":"2020-07-24T16:58:44Z"
  };
*/
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
