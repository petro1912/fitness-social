import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> images = [];
  String description = '';
  void initState() {
    super.initState();
    setState(() {
      images = [
        'club-item1',
        'club-item2',
        'club-item3',
      ];
      description =
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. \n If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.\n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'about us',
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                PrimaryText('Fitness App', 28, true),
                SizedBox(height: 15),
                BlackText('How Great Is The \nStrength Of Your Belief', 20,
                    true, true),
                SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 90,
                    height: 24,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        alignment: Alignment.center,
                        color: secondaryColor,
                        child: WhiteText('Fitness Style', 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: .8,
                enlargeCenterPage: true,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                /* onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }, */
              ),
              items: List.generate(
                images.length,
                (index) => ClipRRect(
                  child: Image(
                    image: getAssetImage(images[index]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: mainHrPadding,
            child: BlackText(description, 14),
          )
        ],
      ),
    );
  }
}
