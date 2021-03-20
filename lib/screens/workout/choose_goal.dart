import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/workout/goal.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class ChooseGoalScreen extends StatefulWidget {
  _ChooseGoalScreenState createState() => _ChooseGoalScreenState();
}

class _ChooseGoalScreenState extends State<ChooseGoalScreen> {
  final List chooseItemList = [
    ['Lose Weight', 'assets/images/lose_weight.png'],
    ['Build Muscles', 'assets/images/muscle.png'],
    ['Shred', 'assets/images/shred.png'],
    ['Stamina', 'assets/images/stamina.png'],
    ['CrossFit', 'assets/images/crossfit.png'],
    ['Healthy Lifestyle', 'assets/images/healthy.png'],
  ];
  int active_item = 3;

  void goNextStep(context) {
    navPush(context, GoalScreen());
  }

  Widget buildChooseItem(int index) {
    return InkWell(
      onTap: () => setState(() {
        active_item = index;
      }),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: index == active_item ? primaryColor : white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: textColor.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 12,
            )
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: index == active_item
                  ? whiteText(chooseItemList[index][0], 14, true)
                  : blackText(chooseItemList[index][0], 14, true),
            ),
            Positioned.fill(
              child: Image(image: AssetImage(chooseItemList[index][1])),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'workout',
      child: Container(
        width: getWindowWidth(context),
        margin: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blackText('GOAL', 18, true),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => buildChooseItem(index),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: RoundedRaisedButton(
                filled: true,
                label: 'Next',
                action: () => goNextStep(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
