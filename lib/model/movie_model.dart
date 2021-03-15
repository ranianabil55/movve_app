class Movie {
  int id;
  String title;
  String overview;
  String releaseDate;
  num vote;
  String photo;

  Movie.fromJson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.overview = map["overview"];
    this.releaseDate = map["release_date"];
    this.vote = map["vote_average"];
    this.photo = "https://image.tmdb.org/t/p/w342" + map["poster_path"];
  }

  // @override
  // String toString() {
  //   return this.title.toString();
  // }
}
