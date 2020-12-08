import 'package:MyFirstApp/widgets/movies.dart';
import 'package:MyFirstApp/widgets/genres-list.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Home Is building');
    return SingleChildScrollView(
        child: Column(
          children: [
            GenresList(),
            Movies(),
          ],
        ),);
  }
}
