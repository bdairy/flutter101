import 'package:MyFirstApp/movies.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:flutter/material.dart';

import './movie-type.dart';

class Home extends StatefulWidget {
  List<dynamic> movieGenures = [];
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
  Map<String, dynamic> selectedMovieGenure;
  ApiService _service = ApiService();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
     _service.getMovieGenres().then((result) {
      setState(() {
              widget.movieGenures = result;
      });
 
     });
  }

  @override
  Widget build(BuildContext context) {
    print('Building');
    selectMovieGenure(Map<String, dynamic> genure) {
      print('Selecte genure is: $selectedMovieGenure');
      setState(() {
        selectedMovieGenure = genure;
      });
    }

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
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.movieGenures.length,
                itemBuilder: (context, index) {
                  return MovieType(
                    isSelected: selectedMovieGenure != null &&
                        widget.movieGenures[index]['name'] ==
                            selectedMovieGenure['name'],
                    clickHandler: (Map<String, dynamic> gener) =>
                        selectMovieGenure(gener),
                    gener: widget.movieGenures[index],
                  );
                },
              ),
            ),
            if (selectedMovieGenure != null)
              Container(
                // child: Movies(
                //   genure: selectedMovieGenure,
                // ),
              )
            else
              Container(
                height: 400,
                child: Container(
                  color: Colors.red,
                ),
              )
          ],
        ),
      ),
    );
  }
}
