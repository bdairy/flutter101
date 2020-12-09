import 'dart:convert';

import 'package:MyFirstApp/models/auth-result.dart';
import 'package:MyFirstApp/models/genre.dart';
import 'package:MyFirstApp/models/http_exception.dart';
import 'package:MyFirstApp/models/movie-item.dart';
import 'package:MyFirstApp/models/movie-result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final _apiKey = 'bca78b13aa1e8607960d8d369d9d0602';
  final String firebaseApiKey = 'AIzaSyAixS1iziaYC7b24Db-aU0oVhEF_Ja9nXc';

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

  Future<MovieItem> getMovieDetails(int movieId) async {
    var url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey&language=en-US';
    var result = await http.get(url);
    var map = json.decode(result.body);

    return MovieItem.fromJson(map);
  }

  Future<MovieResult> getMovieByGenre(int genreId) async {
    var url =
        'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&with_genres=$genreId&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1';
    var result = await http.get(url);
    return MovieResult.fromJson(json.decode(result.body));
  }

  Future<MovieResult> getPopularMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1';
    var result = await http.get(url);
    return MovieResult.fromJson(json.decode(result.body));
  }

  Future<MovieResult> getUpcomingMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=1';
    var result = await http.get(url);
    return MovieResult.fromJson(json.decode(result.body));
  }

  Future<AuthResult> registerUser(String email, String password) async {
    try {
      final String url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey';
      var creds = {
        'email': email.trim(),
        'password': password.trim(),
        "returnSecureToken": true
      };
      var result = await http.post(url, body: json.encode(creds));
      var body = json.decode(result.body);
      if (body['error'] != null) {
        throw HttpException(body['error']['message']);
      }
      AuthResult _data = AuthResult.fromJson(body);
      return _data;
    } catch (e) {
      throw e;
    }
  }

    Future<AuthResult> login(String email, String password) async {
    try {
      final String url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey';
      var creds = {
        'email': email.trim(),
        'password': password.trim(),
        "returnSecureToken": true
      };
      var result = await http.post(url, body: json.encode(creds));
      var body = json.decode(result.body);
      if (body['error'] != null) {
        throw HttpException(body['error']['message']);
      }
      AuthResult _data = AuthResult.fromJson(body);
      return _data;
    } catch (e) {
      throw e;
    }
  }
}
