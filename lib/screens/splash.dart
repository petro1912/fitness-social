import 'package:fitness/constants.dart';
import 'package:fitness/screens/workout/workout.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/screens/login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.colorBurn),
                image: AssetImage('assets/images/splash.png'),
              ),
            ),
          ),
          Container(
            height: getWindowHeight(context) * 0.55,
            width: getWindowWidth(context),
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      SecondaryText('Fitness App', 28, true),
                      SizedBox(
                        height: 18,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: listSplashText.map((text) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    WhiteText(text[0].toUpperCase(), 24, true),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: WhiteText(text[1], 18, true, true),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          listSplashText.length,
                          (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? white.withOpacity(.5)
                                    : white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      child: RoundedRaisedButton(
                        filled: true,
                        label: 'Get Started',
                        action: () => navPush(context, WorkoutScreen()),
                      ),
                    ),
                    TextButton(
                      child: WhiteText('Sign in', 16),
                      onPressed: () => navPush(context, LoginScreen()),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
