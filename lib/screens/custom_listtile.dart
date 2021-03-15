import 'package:flutter/material.dart';
import 'package:movve_app/model/movie_model.dart';

import 'movie_details.dart';

class CustomListTile extends StatelessWidget {
  String header;
  List<Movie> movies = List();
  CustomListTile(this.movies, this.header);
  String imageURL = 'https://image.tmdb.org/t/p/w342';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(header),
      ),
      body: ListView.builder(
          itemCount: movies.length,
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
              },
              child: Card(
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    // Hero(
                    //   tag: "top",
                    //   child:
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            movie.photo,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 120,
                      // width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 230,
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            movie.releaseDate,
                            textAlign: TextAlign.left,
                            // softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                              //fontWeight: FontWeight.
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Rating : ${movie.vote.toString()}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
