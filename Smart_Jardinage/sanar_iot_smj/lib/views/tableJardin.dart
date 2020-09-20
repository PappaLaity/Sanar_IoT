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

class TableJardin extends StatefulWidget {
  @override
  TableState createState() => TableState();
}

class TableState extends State<TableJardin> {

  static String device = "b827ebfbd8ad_15";
  static String urlDevices ="https://api.waziup.io/api/v2/devices/"+device;
  List data;
  int TC = 0 ,SM = 0,HM=0;

  Future<String> getJsonData() async {
    //var response = '';
      var response = await http.get(
        Uri.encodeFull(urlDevices),
        headers: {"Accept": "application/json"}
      );
      print('Data');
      //print(response.body);
      setState((){
          var convertDataToJson =json.decode(response.body);// JSON.decode(response.body);
          data = convertDataToJson['sensors'];
          TC = data[1]['value']['value'];
          SM = data[2]['value']['value'];
          HM = data[3]['value']['value'];
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
    'Nom': 'Table 1',
    'Type Culture': 'Carotte',
    'Tmp': '38',
    'HM': '68',
    'SM': '78',
    'ST': '32'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMJ TABLE-ID',
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
                        width: 5.0,
                      ),
                      /*Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,
                      ),*/
                      //Text(TableInfo['Tmp']),
                      Image.asset('images/tmpe.png',
                        height: 80.0, width: 80.0,),
                      SizedBox(
                        width: 0.0,
                      ),
                      Text('$TC Deg',style: TextStyle(
                          fontSize: 25.0
                      ),), // TEmperature
                      SizedBox(
                        width: 20.0,
                      ),
                      /*Icon(Icons.opacity,
                        color: Colors.blue[500],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset('images/hm.png',
                        height: 80.0, width: 80.0,),
                      SizedBox(
                        width: 0.0,
                      ),
                      Text("$HM %",style: TextStyle(
                        fontSize: 25.0
                      ),), // humidity
                    ],
                  ),
                  SizedBox(
                        height: 50.0,
                      ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      /*
                      Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset('images/stmp.jpeg',
                      height: 80.0, width: 80.0,),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('49 Deg',style: TextStyle(
                          fontSize: 25.0
                      ),), // Soil Temp
                      SizedBox(
                        width: 25.0,
                      ),
/*                      Icon(Icons.tonality,
                        color: Colors.green[200],
                        size: 65.0,),
                      //Text(TableInfo['Tmp']),*/
                      Image.asset('images/shm.png',
                        height: 80.0, width: 80.0,),
                      SizedBox(
                        width: 07.0,
                      ),
                      Text('$SM %',style: TextStyle(
                          fontSize: 25.0
                      ),), // Soil Hum
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
