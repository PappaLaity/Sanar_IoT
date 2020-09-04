import 'package:flutter/cupertino.dart';
/**
 * Inscription 
 * Nom // Username
 * ID (numero Tel / Email) 
 * PWD
 * Gateway ID
 * link Vers Connexion
 * 4 chiffres pour confirmer
 */

// Pas de AppBar tout en Blanc Titre et Inscription

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Inscription extends StatefulWidget {
  @override
  InscriptionState createState() => InscriptionState();
}

class InscriptionState extends State<Inscription> {
  String pseudo = '';
  String numero = '';
  String password = '';
  String successInscription = '';
  // l'un des champs est vide
  String erreur = '';
  final TextEditingController _controllerUser = new TextEditingController();
  final TextEditingController _controllerNumber = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  //final TextEditingController _controllerGID = new TextEditingController();

  onPressed(BuildContext context) {
/*    print(pseudo);
    print(numero);
    print(password);
    print(_controllerUser.text);
    print(_controllerPassword.text);
    print(_controllerNumber.text);*/
    //Navigator.of(context).pushReplacementNamed('/home');
  }

  void onChanged(value, flag) {
    setState(() {
      if (flag == 1) {
        pseudo = value;
      } else {
        if (flag == 2) {
          numero = value;
        } else {
          // flag == 3
          password = value;
        }
      }
    });

//    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
        title: Text('SMART MICRO JARDINAGE',
        style:TextStyle(
          fontFamily: 'Monserrat',
          fontSize: 20.0
        )),
        actions: <Widget>[
        ],
      ),*/
        body: new Container(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  //Title App
                  padding: EdgeInsets.fromLTRB(45, 20, 0.0, 0.0),
                  child: Text(
                    'SMART MICRO JARDIN',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 50, 0.0, 0.0),
                  child: Text(
                    'INSCRIPTION',
                    style:
                        TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Container(
              // Form
              child: Column(
            children: <Widget>[
              TextField(
                controller: _controllerUser,
                decoration: InputDecoration(
                    labelText: 'Pseudo',
                    labelStyle: TextStyle(),
                    hintText: "Votre Nom d'utilisateur"),
                // onChanged: (String value){onChanged(value,1);},
              ),/*
              TextField(
                controller: _controllerGID,
                decoration: InputDecoration(
                    labelText: 'Gateway ID ',
                    labelStyle: TextStyle(),
                    hintText: "l'Identifiant de la Passerelle"),
                //onChanged: (String value){onChanged(value,2);}
              ),*/
              TextField(
                controller: _controllerNumber,
                decoration: InputDecoration(
                    labelText: 'Numero',
                    labelStyle: TextStyle(),
                    hintText: "Votre Numero de Telephone"),
                //onChanged: (String value){onChanged(value,2);}
              ),
              TextField(
                obscureText: true,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(),
                    hintText: "Votre Mot de Passe"),
                //onChanged: (String value){onChanged(value,3);}
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                color: Colors.teal,
                child: Center(
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                ),
                onPressed: () {
                  onPressed(context);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment(1.0, 0.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop('/signin');
                  },
                  child: Text(
                    'Se Connecter',
                    style: TextStyle(
                        color: Colors.teal,
                        fontStyle: FontStyle.italic,
                        fontSize: 17.0,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    ));
  }
}
