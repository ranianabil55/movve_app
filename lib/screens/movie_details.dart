import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  String movieOverView;
  String releaseDate;
  num vote;
  String photo;
  String name;
  MovieDetails(
      this.movieOverView, this.releaseDate, this.vote, this.photo, this.name);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 450,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //       // topLeft: Radius.circular(10),
              //       // topRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10)),
              //   image:
              // ),
              child: Image.network(
                widget.photo,
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Text(
                widget.name,
                textScaleFactor: 1.5,
              ),
              subtitle: Text(widget.releaseDate),
            ),
            SizedBox(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rating : ${widget.vote.toString()}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.star, color: Colors.amber)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                widget.movieOverView,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
