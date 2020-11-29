import 'package:flutter/material.dart';

class MovieType extends StatelessWidget {
  final String gener;
  final Function(String) clickHandler;
  MovieType({this.gener, this.clickHandler});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.clickHandler(gener);
      },
      child: Container(
        color: Colors.blue[100],
        width: 100.0,
        height: 100,
        margin: EdgeInsets.all(5),
        child: Center(child: Text(gener)),
      ),
    );
  }
}
