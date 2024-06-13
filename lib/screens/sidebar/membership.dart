import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/dialog_box.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/rounded_icon.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/goal_action.dart';
import 'package:fitness/screens/workout/goal_action_detail.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class MembershipScreen extends StatefulWidget {
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  late GoalActionDetail goalActionDetail;
  
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

  void switchPlan(BuildContext context) {
    showMessage(
      context,
      DialogBox.confirm(
        context,
        title: 'Are you Sure you want to\n switch your Plans',
        yes: 'Subscribe',
        no: 'Not now',
        yesAction: () => navPush(context, GoalActionDetailScreen()),
        noAction: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'membership status',
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
                    Container(
                      child: Image(
                        image: AssetImage("assets/images/cover.png"),
                        width: getWindowWidth(context),
                        fit: BoxFit.cover,
                      ),
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
                      WhiteText(goalActionDetail.title.toUpperCase(), 18, true),
                      BlackText(goalActionDetail.time, 14, true)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: mainHrPadding,
                  child: BlackText(
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
            child: GreyText(goalActionDetail.description, 14),
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
                Avatar(image: 'Photo3', size: 40),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText('Ahmed Sami', 14, true),
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
                label: 'Switch plans',
                filled: true,
                action: () => switchPlan(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
