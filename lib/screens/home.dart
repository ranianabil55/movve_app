import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movve_app/constant.dart';
import 'package:movve_app/model/movie_model.dart';
import 'package:movve_app/networking/movie_client.dart';
import 'package:movve_app/provider/my_provider.dart';
import 'package:movve_app/screens/custom_list.dart';
import 'package:movve_app/screens/custom_listtile.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<List<Movie>> popular = watch(popularProvider);
    AsyncValue<List<Movie>> topRated = watch(topRatedProvider);
    AsyncValue<List<Movie>> upComing = watch(upComingProvider);
    AsyncValue<List<Movie>> nowPlaying = watch(nowPlayingProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mov",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "ve",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: null,
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                  child: Text("Popular Movie", style: kHeadersLines),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => popular.when(
                          data: (popular) => CustomListTile(popular, "Popular"),
                          loading: () => CircularProgressIndicator(),
                          error: (err, stack) => Text("error"),
                        ),
                      ));
                },
              ),
              popular.when(
                data: (popular) => CustomList(popular),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("error"),
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                  child: Text("Top Rated", style: kHeadersLines),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => topRated.when(
                          data: (topRated) =>
                              CustomListTile(topRated, "top Rated"),
                          loading: () => CircularProgressIndicator(),
                          error: (err, stack) => Text("error"),
                        ),
                      ));
                },
              ),
              topRated.when(
                data: (topRated) => CustomList(topRated),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("error"),
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                  child: Text("UpComing", style: kHeadersLines),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => upComing.when(
                          data: (upComing) =>
                              CustomListTile(upComing, "UpComing"),
                          loading: () => CircularProgressIndicator(),
                          error: (err, stack) => Text("error"),
                        ),
                      ));
                },
              ),
              upComing.when(
                data: (upComing) => CustomList(upComing),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("error"),
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                  child: Text("Now Playing", style: kHeadersLines),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => nowPlaying.when(
                          data: (nowPlaying) =>
                              CustomListTile(nowPlaying, "Now Playing"),
                          loading: () => CircularProgressIndicator(),
                          error: (err, stack) => Text("error"),
                        ),
                      ));
                },
              ),
              nowPlaying.when(
                data: (nowPlaying) => CustomList(nowPlaying),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("error"),
              ),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
              //     child: Text(
              //       "Top Rated",
              //       style: kHeadersLines,
              //     ),
              //   ),
              // ),
              // CustomList(this.topRatedMovies),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (ctx) =>
              //                 CustomListTile(this.topRatedMovies, "Upcoming")));
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
              //     child: Text(
              //       "Upcoming",
              //       style: kHeadersLines,
              //     ),
              //   ),
              // ),
              // CustomList(this.upcomingMovies),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (ctx) => CustomListTile(
              //                 this.topRatedMovies, "Now Playing")));
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
              //     child: Text(
              //       "Now Playing",
              //       style: kHeadersLines,
              //     ),
              //   ),
              // ),
              // CustomList(this.nowPlayingMovies),
            ],
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Movie> popularMovies = List();
//   List<Movie> nowPlayingMovies = List();
//   List<Movie> upcomingMovies = List();
//   List<Movie> topRatedMovies = List();
//
//   @override
//   void initState() {
//     MovieClient().getMovies(MovieType.nowPlaying).then((movies) {
//       nowPlayingMovies = movies;
//       setState(() {});
//       print(movies);
//     }).catchError((onError) {
//       print(onError);
//     });
//
//     MovieClient().getMovies(MovieType.popular).then((movies) {
//       popularMovies = movies;
//       setState(() {});
//       print(movies);
//     }).catchError((onError) {
//       print(onError);
//     });
//
//     MovieClient().getMovies(MovieType.upcoming).then((movies) {
//       upcomingMovies = movies;
//       setState(() {});
//       print(movies);
//     }).catchError((onError) {
//       print(onError);
//     });
//
//     MovieClient().getMovies(MovieType.topRated).then((movies) {
//       topRatedMovies = movies;
//       setState(() {});
//       print(movies);
//     }).catchError((onError) {
//       print(onError);
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Mov",
//                           style: TextStyle(
//                               fontSize: 35, fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           "ve",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 35,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.search),
//                       onPressed: null,
//                       iconSize: 30,
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (ctx) => CustomListTile(
//                               this.popularMovies, "Popular Movie")));
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
//                   child: Text("Popular Movie", style: kHeadersLines),
//                 ),
//               ),
//               CustomList(this.popularMovies),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (ctx) => CustomListTile(
//                               this.topRatedMovies, "Top Rated")));
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
//                   child: Text(
//                     "Top Rated",
//                     style: kHeadersLines,
//                   ),
//                 ),
//               ),
//               CustomList(this.topRatedMovies),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (ctx) =>
//                               CustomListTile(this.topRatedMovies, "Upcoming")));
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
//                   child: Text(
//                     "Upcoming",
//                     style: kHeadersLines,
//                   ),
//                 ),
//               ),
//               CustomList(this.upcomingMovies),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (ctx) => CustomListTile(
//                               this.topRatedMovies, "Now Playing")));
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
//                   child: Text(
//                     "Now Playing",
//                     style: kHeadersLines,
//                   ),
//                 ),
//               ),
//               CustomList(this.nowPlayingMovies),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
