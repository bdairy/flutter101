import 'package:flutter/material.dart';

class MovieType extends StatelessWidget {
  final Map<String, dynamic> gener;
  final Function(Map<String, dynamic>) clickHandler;
  MovieType({this.gener, this.clickHandler});
  @override
  Widget build(BuildContext context) {
    print('building ${gener['name']}');
    return GestureDetector(
      onTap: () {
        this.clickHandler(gener);
      },
      child: Container(
        color: Colors.blue[100],
        width: 100.0,
        height: 100,
        margin: EdgeInsets.all(5),
        child: Center(child: Text(gener['name'])),
      ),
    );
  }
}
