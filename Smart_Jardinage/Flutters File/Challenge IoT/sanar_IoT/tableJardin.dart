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
                      Icon(Icons.tonality),
                      //Text(TableInfo['Tmp']),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('TEMPERATURE'),
                      SizedBox(
                        width: 50.0,
                      ),
                      Icon(Icons.tonality),
                      //Text(TableInfo['Tmp']),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Humidity'),
                    ],
                  ),
                  SizedBox(
                        height: 30.0,
                      ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(Icons.tonality),
                      //Text(TableInfo['Tmp']),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('SOIL TEMP'),
                      SizedBox(
                        width: 50.0,
                      ),
                      Icon(Icons.tonality),
                      //Text(TableInfo['Tmp']),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('SOIL Hum'),
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
