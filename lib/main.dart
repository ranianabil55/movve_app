import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movve_app/screens/home.dart';
import 'package:movve_app/screens/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movve',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF8C1F0F),
        accentColor: Color(0xFF8C1F0F),
      ),
      debugShowCheckedModeBanner: false,
      routes: {},
      home: HomeScreen(),
    );
  }
}
