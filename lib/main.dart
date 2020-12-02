import 'package:flutter/material.dart';

import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var lightTheme = ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        
      );
  var darkTheme = ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.blueGrey,
      );
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,

      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'My First App',
      home: Home(),
    );
  }
}
