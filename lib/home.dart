import 'package:MyFirstApp/models/genre.dart';
import 'package:MyFirstApp/movies.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:MyFirstApp/widgets/genres-list.dart';
import 'package:flutter/material.dart';

import './movie-type.dart';

class Home extends StatefulWidget {
  List<Genre> movieGenures = [];
  //   {
  //     'name': 'Comedy',
  //     'color': 'blue',
  //     'movies': [
  //       {'name': 'Dumb & Dumber', 'poster': 'url'},
  //       {'name': 'Them Mask', 'poster': 'url'},
  //       {'name': 'Liar Liar', 'poster': 'url'},
  //       {'name': 'Click', 'poster': 'url'},
  //     ]
  //   },
  //   {
  //     'name': 'Action',
  //     'color': 'red',
  //     'movies': [
  //       {'name': 'Fast & Furious', 'poster': 'url'},
  //       {'name': 'Blood', 'poster': 'url'},
  //     ]
  //   },
  //   {
  //     'name': 'Scifi',
  //     'color': 'purple',
  //     'movies': [
  //       {'name': 'Avengers', 'poster': 'url'},
  //       {'name': 'Justice League', 'poster': 'url'},
  //     ]
  //   },
  //   {
  //     'name': 'Romance',
  //     'color': 'pink',
  //     'movies': [
  //       {'name': 'Titanic', 'poster': 'url'},
  //       {'name': 'Omar & Salma', 'poster': 'url'},
  //     ]
  //   },
  //   {
  //     'name': 'Horror',
  //     'color': 'orange',
  //     'movies': [
  //       {'name': 'Excorcist', 'poster': 'url'},
  //       {'name': 'Saw 1', 'poster': 'url'},
  //     ]
  //   },
  // ];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Genre selectedMovieGenure;
  ApiService _service = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text('Logout'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GenresList(),
            Movies(),
          ],
        ),
      ),
    );
  }
}
