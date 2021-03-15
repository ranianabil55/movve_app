import 'package:flutter/material.dart';
import 'package:movve_app/model/movie_model.dart';
import 'package:movve_app/screens/movie_details.dart';
// class CustomList extends StatefulWidget {
//   @override
//   _CustomListState createState() => _CustomListState();
// }
//
// class _CustomListState extends State<CustomList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class CustomList extends StatelessWidget {
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
            onTap: () {
              String movieOverView = movies[index].overview;
              String releaseDate = movies[index].releaseDate;
              num vote = movies[index].vote;
              String photo = movies[index].photo;
              String name = movies[index].title;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => MovieDetails(
                          movieOverView, releaseDate, vote, photo, name)));
              print(movieOverView);
            },
            child: Container(
              width: 150,
              child: Card(
                elevation: 1.5,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,
                  // verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    // Hero(
                    //   tag: "top",
                    //child:
                    Expanded(
                        flex: 4,
                        child: Image.network(
                          movie.photo,
                        )),
                    //),
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
