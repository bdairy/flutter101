import 'dart:convert';

import 'package:MyFirstApp/models/genre.dart';
import 'package:MyFirstApp/models/movie-result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final _apiKey = 'bca78b13aa1e8607960d8d369d9d0602';
  Future<List<Genre>> getMovieGenres() async {
    var url =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=en-US';
    var result = await http.get(url);
    var map = json.decode(result.body);
    List<Genre> genras = [];
    map['genres'].forEach((g) {
      genras.add(Genre.fromJson(g));
    });
    return genras;
  }

  Future<MovieResult> getMovieByGenre(int genreId) async {
    var url =
        'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&with_genres=$genreId&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1';
    var result = await http.get(url);
    return MovieResult.fromJson(json.decode(result.body));
  }
}
