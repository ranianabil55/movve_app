import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 4), () {
  //     // 5s over, navigate to a new page
  //     Navigator.pushReplacementNamed(context, MyHomePage());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Lottie.asset(
                'assets/lottie/logoo.json',
              )),
        ),
      ),
    );
  }
}
