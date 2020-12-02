import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  final Map<String, dynamic> genure;
  Movies({this.genure});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> movies = genure['movies'];
    return Container(
        width: double.infinity,
        color: Colors.green[200],
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                genure['name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: movies
                  .map(
                    (movie) => ListTile(
                      title: Text(movie['name']),
                      leading: Icon(Icons.movie_sharp),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  )
                  .toList(),
            ),
          ],
        ));
  }
}
