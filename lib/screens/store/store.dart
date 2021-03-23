import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/components/search.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/screens/store/products.dart';
import 'package:fitness/screens/workout/fitness_input.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _currentClubIndex = 0, _currentGymIndex = 0;
  List clubItems, gymItems;
  void initState() {
    super.initState();
  }

  void choosePlan(BuildContext context) {
    navPush(context, FitnessInputScreen());
  }

  List<Widget> _buildClubItems() {
    return List.generate(
      3,
      (index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: textColor.withOpacity(0.15),
                    offset: Offset(2, 2),
                    blurRadius: 8,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/club-item${index + 1}.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    whiteText('Up to 70% off'.toUpperCase(), 22, true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        whiteText('Product Name', 12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0, 1],
                              colors: [
                                Colors.grey.withOpacity(.75),
                                Colors.black12.withOpacity(.75),
                              ],
                            ),
                            border: Border.all(color: greyTextColor),
                          ),
                          child: secondaryText('69.99 SAR', 9, true),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGymItems() {
    return List.generate(
      3,
      (index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: textColor.withOpacity(0.15),
                    offset: Offset(2, 2),
                    blurRadius: 8,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/club-item${index + 1}.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    whiteText('New Arrival', 22, true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        whiteText('Product Name', 12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0, 1],
                              colors: [
                                Colors.grey.withOpacity(.75),
                                Colors.black12.withOpacity(.75),
                              ],
                            ),
                            border: Border.all(color: greyTextColor),
                          ),
                          child: secondaryText('69.99 SAR', 9, true),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildClubCarouselBullets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentClubIndex == index
                ? secondaryColor
                : secondaryColor.withOpacity(.5),
          ),
        ),
      ),
    );
  }

  Widget _buildGymCarouselBullets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentGymIndex == index
                ? secondaryColor
                : secondaryColor.withOpacity(.5),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'store',
      isMain: true,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SearchBox(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  primaryText('CLUB GEAR', 20, true),
                  InkWell(
                    onTap: () =>
                        navPush(context, ProductsScreen(title: 'CLUB GEAR')),
                    child: primaryText('View All', 10),
                  ),
                ],
              ),
            ),
            /* Expanded(
              child: */
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: .76,
                enlargeCenterPage: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentClubIndex = index;
                  });
                },
              ),
              items: _buildClubItems(),
            ),
            /* ), */
            _buildClubCarouselBullets(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  primaryText('GYM GEAR', 20, true),
                  InkWell(
                    onTap: () =>
                        navPush(context, ProductsScreen(title: 'GYM GEAR')),
                    child: primaryText('View All', 10),
                  ),
                ],
              ),
            ),
            /* Expanded(
              child: */
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: .76,
                enlargeCenterPage: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentGymIndex = index;
                  });
                },
              ),
              items: _buildGymItems(),
            ),
            /* ), */
            _buildGymCarouselBullets(),
          ],
        ),
      ),
    );
  }
}
