import 'package:MyFirstApp/models/genre.dart';
import 'package:MyFirstApp/widgets/movie-type.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:flutter/material.dart';

class GenresList extends StatelessWidget {
  const GenresList();
   
 
  @override
  Widget build(BuildContext context) {
      ApiService _service = ApiService();

    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 16),
      child: FutureBuilder(
        future: _service.getMovieGenres(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          List<Genre> _genres = snapshot.data as List<Genre>;
          if (_genres == null || _genres.length == 0) {
            return Container(
              child: Center(
                child: Text('No Data Found'),
              ),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _genres.length,
            itemBuilder: (context, index) {
              return MovieType(
                gener: _genres[index],
              );
            },
          );
        },
      ),
    );
  }
}
