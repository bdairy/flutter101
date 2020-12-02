import 'dart:io';

import 'package:MyFirstApp/services/api.service.dart';
import 'package:flutter/material.dart';

class MovieType extends StatelessWidget {
  final Map<String, dynamic> gener;
  final Function(Map<String, dynamic>) clickHandler;
  final bool isSelected;
  MovieType({this.gener, this.clickHandler, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    ApiService _service = ApiService();
    
    print('building ${gener['name']}');

    Widget defaultChip() {
      return Chip(
        backgroundColor: Theme.of(context).accentColor,
        label: Text(
          gener['name'],
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    Widget selectedChip() {
      return Chip(
        backgroundColor: Theme.of(context).primaryColor,
        label: Text(
          gener['name'],
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        this.clickHandler(gener);
      
      },
      child: Container(
          margin: const EdgeInsets.all(5),
          child: !isSelected ? defaultChip() : selectedChip()),
    );
  }
}
