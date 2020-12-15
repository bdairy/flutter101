import 'package:MyFirstApp/home-tabs/popular-movies.dart';
import 'package:MyFirstApp/home.dart';
import 'package:MyFirstApp/models/movie-item.dart';
import 'package:MyFirstApp/models/movie-result.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MovieDetailsScreen extends StatelessWidget {
  static String routeName = 'movie-details';

  @override
  Widget build(BuildContext context) {
    Widget _container(Widget child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      );
    }

    ApiService _service = ApiService();
    final movie = (ModalRoute.of(context).settings.arguments
        as Map<String, dynamic>)['movie'];
    final _movie = movie as Movie;
    return Scaffold(
      body: 
      CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            title: Text(_movie.title),
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: _movie.id,
                child: Image.network(
                  _movie.posterPath,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _container(Text(
              _movie.title,
              style: Theme.of(context).textTheme.headline3,
            )),
            RaisedButton(
              child: Text('Go Back'),
              color: SystemColors.primary,
              onPressed: () => Navigator.of(context).popUntil(
                ModalRoute.withName('/'),
              ),
            ),
            SizedBox(height: 30),
            _container(Text(_movie.overview)),
            SizedBox(height: 50),
            _container(Text('${_movie.adult}')),
FutureBuilder(
  future: ApiService.determinePosition(),
  builder: (context, snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting){
      return CircularProgressIndicator();
    }
    Position pos = snapshot.data as Position;
  return Text('${pos.latitude} : ${pos.longitude}');
},),

            SizedBox(height: 600),
          ]))
        ],
      ),
    );
  }
}
