import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/rounded_icon.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/goal_action.dart';
import 'package:fitness/screens/workout/workout_payment.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class GoalActionDetailScreen extends StatefulWidget {
  _GoalActionDetailScreenState createState() => _GoalActionDetailScreenState();
}

class _GoalActionDetailScreenState extends State<GoalActionDetailScreen> {
  GoalActionDetail goalActionDetail;
  @override
  void initState() {
    super.initState();
    goalActionDetail = GoalActionDetail(
      imgUrl: 'assets/images/cover.png',
      title: 'Learning boxing from home',
      description:
          'Brief description for this activity .. Brief description for this activity .. Brief description for this activity .. Brief description for this activity .. Brief description for this description for this activity\n - 12 Text Description\n - 34  Text Description\n - 61 Text Description',
      time: '3 Days',
      isAdvanced: true,
    );
  }

  void choosePlan(BuildContext context) {
    navPush(context, WorkoutPaymentScreen());
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'workout',
      pageIndex: 1,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightPrimaryColor,
            ),
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/cover.png"),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Image(
                        image: AssetImage("assets/images/play_video.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      whiteText(goalActionDetail.title.toUpperCase(), 18, true),
                      blackText(goalActionDetail.time, 14, true)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: blackText(
                      goalActionDetail.isAdvanced ? 'Advanced Level' : '',
                      14,
                      true),
                ),
                SizedBox(height: 15)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: greyText(goalActionDetail.description, 14),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            color: lighterPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(image: 'assets/images/Photo3.png', size: 40),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      primaryText('Ahmed Sami', 14, true),
                      lightPrimaryText(
                        'Brief description for this activity .. Brief description for this activity',
                        12,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Icon(Icons.chevron_right, size: 24, color: primaryColor),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedIcon(
                    image: 'assets/images/diet.png',
                    size: 60,
                    color: secondaryColor,
                    borderSize: 6),
                SizedBox(width: 20),
                RoundedIcon(
                    image: 'assets/images/sports.png',
                    size: 60,
                    color: secondaryColor,
                    borderSize: 6),
                SizedBox(width: 20),
                RoundedIcon(
                    image: 'assets/images/protein.png',
                    size: 60,
                    color: secondaryColor,
                    borderSize: 6),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
            child: SizedBox(
              width: double.infinity,
              child: RoundedRaisedButton(
                label: 'Choose this Plan',
                filled: true,
                action: () => choosePlan(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
