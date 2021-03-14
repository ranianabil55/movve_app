import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  int size;
  List movieImage;
  List movieName;
  CustomList(this.size, this.movieImage, this.movieName);
  String imageURL = 'https://image.tmdb.org/t/p/w342';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          itemCount: movieImage.length,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) => GestureDetector(
                  child: Container(
                // width: 150,
                child: Card(
                    elevation: 1.5,
                    child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisSize: MainAxisSize.min,
                        // verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Image.asset(
                                movieImage[index],
                              )),
                          Expanded(
                              child: Center(
                            child: Text(movieName[index],
                                textAlign: TextAlign.center),
                          ))
                        ])),
              ))),
    );
  }
}
