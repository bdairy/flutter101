import 'package:MyFirstApp/models/genre.dart';
import 'package:flutter/foundation.dart';

class GenreProvider with ChangeNotifier{
  Genre _selectedGenre;

  Genre get selectedGenre{
    return _selectedGenre;
  }

  void selectGenre(Genre _genre){
    _selectedGenre = _genre;
    notifyListeners();
  }
}