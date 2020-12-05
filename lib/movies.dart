import 'package:MyFirstApp/models/movie-result.dart';
import 'package:MyFirstApp/providers/genre-provider.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:MyFirstApp/widgets/movie-card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  ApiService _service = ApiService();

  @override
  Widget build(BuildContext context) {
    final _genreProvider = Provider.of<GenreProvider>(context);
    return _genreProvider.selectedGenre != null
        ? FutureBuilder(
            future: _service.getMovieByGenre(_genreProvider.selectedGenre.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 400,
                  child: Center(
                    child:
                        Container(width: 100, child: LinearProgressIndicator()),
                  ),
                );
              }

              MovieResult movies = snapshot.data as MovieResult;

              if (movies == null || movies.movies?.length == 0) {
                return Container(
                  height: 400,
                  child: Center(
                    child: Text('Sorry no data'),
                  ),
                );
              }
              return Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          _genreProvider.selectedGenre.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 4 / 5),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: movies.movies.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              MovieCard(movies.movies[index]))
                    ],
                  ));
            })
        : Container(
          height: 400,
          child: Center(
              child: Text('Please Select Genre'),
            ),
        );
  }
}
