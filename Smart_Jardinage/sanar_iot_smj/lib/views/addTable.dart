import 'package:flutter/material.dart';
import 'package:sanar_iot_smj/db/database_helper.dart';
import 'package:sanar_iot_smj/models/table.dart';

class AddTable extends StatefulWidget {
  @override
  _AddTableState createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {
  TextEditingController controllerTableName = new TextEditingController();
  TextEditingController controllerCultureType = new TextEditingController();
  TextEditingController controllerDeviceId = new TextEditingController();
  TextEditingController controllerTableId = new TextEditingController();
  DatabaseHelper dbHelper;
  String success = "", error = "";

  Future<TableJardin> tab;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
  }

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void addTableInf(BuildContext context) {
    // Test de champs non vide
    if (controllerDeviceId.text != "" &&
        controllerTableName.text != "" &&
        controllerCultureType.text != "") {
      print('Adding Table');
      //setState(() {
      TableJardin table = TableJardin(controllerTableName.text,
          controllerDeviceId.text, controllerCultureType.text);
      final tab = dbHelper.insertTable(table);

      tab.then((table) {
        print('table $table is created');
        setState(() {
          success = "Table Ajoute avec Succes";
          controllerCultureType.text = "";
          controllerDeviceId.text = "";
          controllerTableName.text = "";
        });
      }).catchError((onError) {
        print('Erreur kelk Part: $onError');
      });
    } else {}
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD NEW TABLE',
            style: TextStyle(fontFamily: 'Monserrat', fontSize: 20.0)),
      ),
      body: ListView(children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              /*TextField(
                controller: controllerTableId,
                decoration: InputDecoration(
                    labelText: 'Device ID',
                    labelStyle: TextStyle(),
                    hintText: "Donner l'identifiant du Nouveau Equipement"),
                // onChanged: (String value){onChanged(value,1);},
              ),*/
              TextField(
                controller: controllerDeviceId,
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Device ID',
                    labelStyle: TextStyle(),
                    hintText: "Donner l'identifiant du Nouveau Equipement"),
                // onChanged: (String value){onChanged(value,1);},
              ),
              TextField(
                controller: controllerTableName,
                decoration: InputDecoration(
                    labelText: 'Table',
                    labelStyle: TextStyle(),
                    hintText: "Comment nommez vous la table"),
                // onChanged: (String value){onChanged(value,1);},
              ),
              TextField(
                controller: controllerCultureType,
                decoration: InputDecoration(
                    labelText: 'Culture',
                    labelStyle: TextStyle(),
                    hintText: "Quel type de Culture"),
                // onChanged: (String value){onChanged(value,1);},
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 130.0,
              ),
              RaisedButton(
                //  padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                color: Colors.teal,
                child: Center(
                  child: Text(
                    "Ajouter Table",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                ),
                onPressed: () {
                  addTableInf(context);
                },
              ),
              SizedBox(width: 40.0)
            ],
          ),
        ),
      ]),
    );
  }
}
