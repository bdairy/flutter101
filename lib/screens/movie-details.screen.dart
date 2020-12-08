import 'package:MyFirstApp/home-tabs/popular-movies.dart';
import 'package:MyFirstApp/home.dart';
import 'package:MyFirstApp/models/movie-item.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  static String routeName = 'movie-details';

  @override
  Widget build(BuildContext context) {
    ApiService _service = ApiService();
    final movieId = (ModalRoute.of(context).settings.arguments
        as Map<String, dynamic>)['movieId'];
    return Scaffold(
      appBar: new AppBar(),
      body: FutureBuilder(
        future: _service.getMovieDetails(movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final _movie = snapshot.data as MovieItem;
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  _movie.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                RaisedButton(
                  child: Text('Go Back'),
                  color: SystemColors.primary,
                  onPressed: () => Navigator.of(context).popUntil(
                    ModalRoute.withName('/'),
                  ),
                ),
                
                SizedBox(height: 30),
                PopularMoviesTap()
              ],
            ),
          );
        },
      ),
    );
  }
}
