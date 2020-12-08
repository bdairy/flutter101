import 'package:MyFirstApp/models/movie-result.dart';
import 'package:MyFirstApp/screens/movie-details.screen.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard(this.movie);
  @override
  Widget build(BuildContext context) {
    double _imgWidth = (MediaQuery.of(context).size.width - 32) / 2;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MovieDetailsScreen.routeName, arguments: {'movieId': movie.id}
          // MaterialPageRoute(
          //   builder: (context) => MovieDetailsScreen(movieId: movie.id),
          // ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, 2.0),
                      blurRadius: 3)
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  height: 150,
                  width: _imgWidth,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              child: Text(
                movie.title,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${movie.voteAverage}',
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Spacer(),
                Container(
                  child: Text(
                    '${movie.voteCount} votes',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
