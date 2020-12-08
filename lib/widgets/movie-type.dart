import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/genre.dart';
import '../providers/genre-provider.dart';

class MovieType extends StatelessWidget {
  final Genre gener;

  MovieType({
    this.gener,
  });
  @override
  Widget build(BuildContext context) {
    Widget defaultChip(Widget icon) {
      return Chip(
        backgroundColor: SystemColors.accent,
        label: Text(
          gener.name,
          style: TextStyle(color: Colors.white),
        ),
        avatar: icon,
      );
    }

    Widget selectedChip(Widget icon) {
      return Chip(
        backgroundColor: SystemColors.primarylight,
        label: Text(
          gener.name,
          style: TextStyle(color: Colors.white),
        ),
        avatar: icon,
      );
    }

    Widget _switchChip(Genre genre, Widget icon) {
      var isSelected = genre != null && gener.id == genre.id;
      if (isSelected) {
        return selectedChip(icon);
      } else {
        return defaultChip(icon);
      }
    }

    return Consumer<GenreProvider>(
        child: Icon(
          Icons.circle,
          color: Colors.white,
          size: 10,
        ),
        builder: (context, provider, child) {
          return GestureDetector(
            onTap: () async {
              provider.selectGenre(gener);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: _switchChip(provider.selectedGenre, child),
            ),
          );
        });
  }
}
