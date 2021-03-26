import 'package:fitness/components/dashbard_radio.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CommunityDashboardScreen extends StatefulWidget {
  _CommunityDashboardScreenState createState() =>
      _CommunityDashboardScreenState();
}

class _CommunityDashboardScreenState extends State<CommunityDashboardScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'community',
      pageIndex: 2,
      child: Column(
        children: [
          Container(
            height: 240,
            color: primaryColor.withOpacity(.6),
          ),
          SizedBox(height: 20),
          Padding(
            padding: mainHrPadding,
            child: Column(
              children: [
                Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 42.0,
                      lineWidth: 4.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: 0.75,
                      center: PrimaryText("75%", 10, true),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.black.withOpacity(.1),
                      progressColor: primaryColor,
                    ),
                    SizedBox(width: 20),
                    PrimaryText('Community Average', 14, true),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 42.0,
                      lineWidth: 4.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: 0.5,
                      center: SecondaryText("50%", 10, true),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.black.withOpacity(.1),
                      progressColor: secondaryColor,
                    ),
                    SizedBox(width: 20),
                    SecondaryText('Your Stats', 14, true),
                  ],
                ),
                SizedBox(height: 20),
                RadioGroup(groupItems: [
                  GroupItem(name: 'Health Activities', color: secondaryColor),
                  GroupItem(
                      name: 'Activities Participation', color: primaryColor),
                  GroupItem(name: 'Calories Burn', color: primaryColor),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
