import 'package:flutter/material.dart';
import 'package:fitness/screens/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: 'Gotham',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
