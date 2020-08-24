import 'package:flutter/material.dart';
import 'package:sanar_iot_smj/views/accueil.dart';
import 'package:sanar_iot_smj/views/connexion.dart';
import 'package:sanar_iot_smj/views/inscription.dart';
import 'package:sanar_iot_smj/views/tableJardin.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: prefix0.Accueil(),
      home: Connexion(),
      routes: <String,WidgetBuilder>{
        '/home':(BuildContext context)=> new Accueil(),
        '/signin':(BuildContext context)=> new Inscription(),
        '/login':(BuildContext context)=> new Connexion(),
        '/table':(BuildContext context)=> new TableJardin()
      }
    );
  }
}
