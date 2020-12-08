import 'package:MyFirstApp/widgets/movies-upcoming.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return 
    SingleChildScrollView(child:MoviesUpcoming());
 
  }
}
