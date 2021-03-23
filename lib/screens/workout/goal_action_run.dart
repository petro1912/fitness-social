import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/goal_action.dart';
import 'package:fitness/screens/workout/diets.dart';
import 'package:fitness/screens/workout/exercises.dart';
import 'package:fitness/screens/workout/supplements.dart';
import 'package:fitness/screens/workout/workout_payment.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class GoalActionRunScreen extends StatefulWidget {
  _GoalActionRunScreenState createState() => _GoalActionRunScreenState();
}

class _GoalActionRunScreenState extends State<GoalActionRunScreen> {
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

  List<Widget> getActionList(BuildContext context) {
    List actionType = ['Exercise', 'Diet', 'Supplements'];
    List actionDesc = [
      'Parts of the body training ',
      '500 Calories per day',
      '10 of Supplements '
    ];
    List icons = [
      'assets/images/sports_white.png',
      'assets/images/lose_weight_white.png',
      'assets/images/protein_white.png'
    ];
    List actionColor = [primaryColor, secondaryColor, thirdColor];
    List navs = [
      ExercisesScreen(),
      DietsScreen(),
      SupplementsScreen(),
    ];
    return List.generate(3, (index) {
      return GestureDetector(
        onTap: () => navPush(context, navs[index]),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: textColor.withOpacity(0.1),
                blurRadius: 30,
                offset: Offset(4, 4),
              ),
            ],
            color: white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: actionColor[index],
                    ),
                    child: Image(
                      image: AssetImage(icons[index]),
                      width: 16,
                      height: 16,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(actionType[index],
                      style: TextStyle(
                        color: actionColor[index],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ))
                ],
              ),
              blackText(actionDesc[index])
            ],
          ),
        ),
      );
    });
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
                      blackText(goalActionDetail.time, 14, true),
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
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    goalActionDetail.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: Column(children: getActionList(context)),
          ),
        ],
      ),
    );
  }
}
