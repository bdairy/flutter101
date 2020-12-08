import 'package:MyFirstApp/widgets/movies-popular.dart';
import 'package:flutter/material.dart';

class PopularMoviesTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(child: MoviesPopular());
  }
}
