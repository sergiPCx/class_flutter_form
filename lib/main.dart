import 'package:flutter/material.dart';
import 'package:hola_mundo/src/pages/login.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'hola mundo',
        initialRoute: 'login',
        routes: {
          'login':  (BuildContext context) => LoginPage(),
        },
    );
  }
}