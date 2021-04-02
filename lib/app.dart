import 'package:fitness/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/screens/splash.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuProvider(), // ← create/init your state model
      child: MaterialApp(
        title: 'Fitness App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // fontFamily: 'Gotham',
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
