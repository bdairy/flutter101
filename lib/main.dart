import 'package:MyFirstApp/movie-type.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    List<String> movieGenures = [
      'Comedy',
      'Action',
      'Scifi',
      'Romance',
      'Horror'
    ];
    return MaterialApp(
      title: 'My First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text('Logout'),
            ),
          ],
        ),
        body: Container(
          height: 100,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              MovieType(
                gener: movieGenures[0],
                clickHandler: (String gener) {
                  print('clicked $gener');
                },
              ),
              MovieType(
                gener: movieGenures[1],
                clickHandler: (String gener) {
                  print('clicked $gener');
                },
              ),
              MovieType(
                gener: movieGenures[2],
                clickHandler: (String gener) {
                  print('clicked $gener');
                },
              ),
              MovieType(
                gener: movieGenures[3],
                clickHandler: (String gener) {
                  print('clicked $gener');
                },
              ),
              MovieType(
                gener: movieGenures[4],
                clickHandler: (String gener) {
                  print('clicked $gener');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
