import 'package:MyFirstApp/providers/genre-provider.dart';
import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var lightTheme = ThemeData(
    primarySwatch: SystemColors.primary,
    accentColor: SystemColors.accent,
  );
  var darkTheme = ThemeData(
    primarySwatch: Colors.lightBlue,
    accentColor: Colors.blueGrey,
  );
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GenreProvider()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        title: 'My First App',
        home: Home(),
      ),
    );
  }
}
