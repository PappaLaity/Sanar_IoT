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

class TableJardin extends StatefulWidget {
  @override
  TableState createState() => TableState();
}

class TableState extends State<TableJardin> {
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
                      Text('36 Deg',style: TextStyle(
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
                      Text('43%',style: TextStyle(
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
                      Text('75%',style: TextStyle(
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
