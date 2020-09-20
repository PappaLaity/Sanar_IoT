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
  DatabaseHelper dbHelper;
  Future<TableJardin> tab;
  @override
  void initState() {
    super.initState();
    dbHelper= new DatabaseHelper();
  }

  void addTableInf(BuildContext context){
    print('Adding Table');
    setState(() {
      TableJardin table =  TableJardin(controllerDeviceId.text,controllerTableName.text,controllerCultureType.text);
      tab = dbHelper.saveTable(table);
      tab.then((onValue){
        print('Data');
        print(onValue);
      }).catchError((onError){
        print('Error object');
        print(onError);
      });
    });
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
              TextField(
                controller: controllerDeviceId,
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
