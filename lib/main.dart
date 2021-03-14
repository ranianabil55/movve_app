import 'package:flutter/material.dart';
import 'package:movve_app/screens/home.dart';
import 'package:movve_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movve',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
