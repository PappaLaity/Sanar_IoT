import 'dart:convert';

/**
 * Bienvenue Nom Appli
 * ID (Numero or mail or Username) - PWD
 * Pas de Compte Inscription
 */
import 'package:flutter/material.dart';
import 'package:sanar_iot_smj/db/database_helper.dart';
import 'package:sanar_iot_smj/models/user.dart';
import 'package:sanar_iot_smj/views/connexion_presenter.dart';

class Connexion extends StatefulWidget {
  @override
  ConnexionState createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> implements ConnexionContract {
  final TextEditingController _controllerUsername = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();

  BuildContext _ctx;
  bool isloading;
  final formkey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password, erreur = '';
  DatabaseHelper dbHelper;
  //Future <List<User>> jsondata;
  Future<List<User>> userslist;
  List<User> users;

  ConnexionPresenter _presenter;

  int count;

//  User user;
  ConnexionState() {
    _presenter = new ConnexionPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    //refreshUserList();
    erreur = '';
  }

  refreshUserList() {
    userslist = dbHelper.getUsers();
    userslist.then((data) {
      setState(() async {
        if (data != null) {
          this.users = data;
          this.count = data.length;
        }
      });
    });
    for (var i = 0; i < users.length; i++) {
      print(users[i]);
    }
  }

  int verify(_username, _password, users) {
    var result = 0;
    for (var i = 0; i < users.length; i++) {
      var user = users[i];
      if (user['username'] == _username && user['password'] == _password) {
        return 1;
      }
    }
    return result;
  }

  onPressed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/home');
    /*if (_controllerUsername.text != null && _controllerPassword.text != null) {
      setState(() {
        //isloading = true;
        _username = _controllerUsername.text;
        _password = _controllerPassword.text;
      });
      //if (dbHelper.verify(_username, _password) != null) {
      if (verify(_username, _password, this.users) == 1) {
        print('User in Database');
        //print(dbHelper.verify(_username, _password));
        //Navigator.of(context).pushReplacementNamed('/home');
      } else {
        print('Erreur Login ou mdp incorrect ou non inscris');

        setState(() {
          erreur = 'Erreur Login ou mdp incorrect ou non inscris';
        });
      }
      // _presenter.doLogin(_username, _password);
    }*/
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text(text)));
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      isloading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      isloading = false;
    });
    var db = DatabaseHelper.instance;
    await db.saveUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
//                    textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(100, 50, 0.0, 0.0),
                      child: Text(
                        'Connection',
                        style: TextStyle(
                            fontSize: 20.0, fontStyle: FontStyle.italic),
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
                    controller: _controllerUsername,
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
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "mot de passe oublie",
                        style: TextStyle(
                            color: Colors.teal,
                            fontStyle: FontStyle.italic,
                            fontSize: 17.0,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    color: Colors.teal,
                    child: Center(
                      child: Text(
                        "Se Connecter",
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
                        Navigator.of(context).pushNamed('/signin');
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.teal,
                            fontStyle: FontStyle.italic,
                            fontSize: 17.0,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      erreur,
                      style: TextStyle(),
                    ),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
