import 'package:fitness/components/card.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/workout/goal_action.dart';
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
    ['Stamina', 'assets/images/sports_white.png'],
    ['CrossFit', 'assets/images/crossfit.png'],
    ['Healthy Lifestyle', 'assets/images/healthy.png'],
  ];

  int activeItem = 3;

  void goNextStep(context) {
    navPush(context, GoalActionScreen());
  }

  Widget buildChooseItem(int index) {
    return InkWell(
      onTap: () => setState(() {
        activeItem = index;
        goNextStep(context);
      }),
      child: RRCard(
        color: index == activeItem ? primaryColor : white,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: index == activeItem
                  ? WhiteText(chooseItemList[index][0], 14, true)
                  : BlackText(chooseItemList[index][0], 14, true),
            ),
            Positioned.fill(
              // child: Image(image: AssetImage(chooseItemList[index][1])),
              child: Image.asset(
                chooseItemList[index][1],
                color: index == activeItem ? white : primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'workout',
      pageIndex: 1,
      child: Container(
        width: getWindowWidth(context),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackText('GOAL', 18, true),
              SizedBox(height: 15),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => buildChooseItem(index),
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20),
              ),
              SizedBox(
                height: 10,
              ),
              /* SizedBox(
                width: double.infinity,
                child: RoundedRaisedButton(
                  filled: true,
                  label: 'Next',
                  action: () => goNextStep(context),
                ),
              ),
              SizedBox(
                height: 30,
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
