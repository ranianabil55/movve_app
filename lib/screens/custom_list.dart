import 'package:flutter/material.dart';
import 'package:movve_app/model/movie_model.dart';

class CustomList extends StatelessWidget {
  int size;
  List movieImage;
  List movieName;
  List<Movie> movies = List();
  CustomList(this.movies);
  String imageURL = 'https://image.tmdb.org/t/p/w342';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: movies.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          Movie movie = movies[index];
          return GestureDetector(
            child: Container(
              width: 150,
              child: Card(
                elevation: 1.5,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,
                  // verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: Image.network(
                          movie.photo,
                        )),
                    Expanded(
                      child: Center(
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
