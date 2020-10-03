import 'dart:convert';

/**
 * Information sur une table... 
 * Nom Table, Type de Culture, Duree de Vie
 * Temperature , Humidite de l'air
 * Temerature du sol, Humidite du sol,
 * Actions
 * Arroser...
 * Retour a liste Tables
 */

// L'id du table a passer en param
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TableJardinClass extends StatefulWidget {
  TableJardinClass({Key key, this.devicesId, this.tableName});
  final devicesId;
  final tableName;
  @override
  TableState createState() => TableState(devicesId, tableName);
}

class TableState extends State<TableJardinClass> {
  final String device;
  final String tablename;
  var urlDevices;
  TableState(this.device, this.tablename) {
    urlDevices = "https://api.waziup.io/api/v2/devices/" + device;
  }

  //static String device = "b827ebfbd8ad_15";

  List data;
  int TC = 0, SM = 0, HM = 0, WT = 0, ST = 0;

  Future<String> getJsonData() async {
    //var response = '';
    print(urlDevices);
    var response = await http.get(Uri.encodeFull(urlDevices),
        headers: {"Accept": "application/json"});
    print('Data');
    //print(response.body);
    setState(() {
      var convertDataToJson =
          json.decode(response.body); // JSON.decode(response.body);
      data = convertDataToJson['sensors'];
      if (data[1]['value']['value']!=null) {
        TC = data[1]['value']['value'];
      }
      if (data[2]['value']['value']!=null) {
        SM = data[2]['value']['value'];
      }
      if (data[3]['value']['value']!=null) {
        HM = data[3]['value']['value'];
      }
      /*
      if (data[4]['value']['value']!=null) {
        ST = data[4]['value']['value'];
      }
      if (data[5]['value']['value']!=null) {
        WT = data[5]['value']['value'];
      }*/
    });
    print(data[1]['value']['value']); //Air Humidity HM
    print(data[2]['value']['value']); // SM 2
    print(data[3]['value']['value']); // TC
    return "success";
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

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
  var TableInfo = {
    'Nom': 'Table 4',
    'Type Culture': 'Tomate',
    'Tmp': '38',
    'HM': '68',
    'SM': '78',
    'ST': '32'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tablename,
            style: TextStyle(fontFamily: 'Monserrat', fontSize: 20.0)),
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25.0),
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(TableInfo['Nom']),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(TableInfo['Type Culture']),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15.0,
                      ),
                      /*Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,
                      ),*/
                      //Text(TableInfo['Tmp']),
                      Image.asset(
                        'images/tmpe.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      SizedBox(
                        width: 0.0,
                      ),
                      Text(
                        '$TC Deg',
                        style: TextStyle(fontSize: 35.0),
                      ), // TEmperature
                      SizedBox(
                        width: 30.0,
                      ),
                      /*Icon(Icons.opacity,
                        color: Colors.blue[500],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset(
                        'images/hm.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      SizedBox(
                        width: 0.0,
                      ),
                      Text(
                        "$HM %",
                        style: TextStyle(fontSize: 35.0),
                      ), // humidity
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15.0,
                      ),
                      /*
                      Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset(
                        'images/stmp.jpeg',
                        height: 40.0,
                        width: 40.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '$ST Deg',
                        style: TextStyle(fontSize: 35.0),
                      ), // Soil Temp
                      SizedBox(
                        width: 30.0,
                      ),
/*                      Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset(
                        'images/shm.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      SizedBox(
                        width: 07.0,
                      ),
                      Text(
                        '$SM %',
                        style: TextStyle(fontSize: 35.0),
                      ), // Soil Hum
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15.0,
                      ),
                      /*
                      Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset(
                        'images/watertmp.jpg',
                        height: 40.0,
                        width: 40.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '$WT Deg',
                        style: TextStyle(fontSize: 35.0),
                      ), // Soil Temp
                      SizedBox(
                        width: 30.0,
                      ), // Soil Hum
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              // Les Actions -- Notifications
              // Suivant les param emettre des notifs
              )
        ],
      ),
    );
  }
}
