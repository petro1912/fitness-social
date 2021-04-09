import 'package:fitness/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness/screens/splash.dart';
import 'package:provider/provider.dart';

import 'components/animated_splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return ChangeNotifierProvider(
      create: (context) => MenuProvider(), // ← create/init your state model
      child: MaterialApp(
        title: 'Fitness App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          // fontFamily: 'Gotham',
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplash(
          logoText: 'Fitness App',
          // imagePath: 'assets/images/layout/splash.png',
          home: SplashScreen(),
          duration: 2000,
          type: AnimatedSplashType.StaticDuration,
        ),
      ),
    );
  }
}
