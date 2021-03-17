import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:movve_app/model/movie_model.dart';
import 'package:movve_app/provider/my_provider.dart';
import 'package:movve_app/screens/login_screen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 4), () {
//       // 5s over, navigate to a new page
//       Navigator.push(
//           context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Hero(
//             tag: "logo",
//             child: Container(
//                 // width: double.infinity,
//                 //height: double.infinity,
//                 child: Lottie.asset(
//               'assets/lottie/logoo.json',
//             )),
//           ),
//           SizedBox(
//             height: 120,
//             width: 200,
//             child: Row(children: [
//               FadeAnimatedTextKit(
//                 text: ['Mov'],
//                 textStyle: TextStyle(
//                     fontSize: 60,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//                 textAlign: TextAlign.center,
//               ),
//               FadeAnimatedTextKit(
//                 text: ['ve'],
//                 textStyle: TextStyle(
//                     fontSize: 60,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ]),
//           )
//         ]),
//       ),
//     );
//   }
// }
