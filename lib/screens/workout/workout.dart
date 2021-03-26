import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/screens/workout/fitness_input.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  void choosePlan(BuildContext context) {
    navPush(context, FitnessInputScreen());
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'workout',
      pageIndex: 1,
      isMain: true,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: BlackText(strNoPlan.toUpperCase(), 32, true, true),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: mainHrPadding,
              child: SizedBox(
                width: double.infinity,
                child: RoundedRaisedButton(
                  label: 'Choose your plan',
                  filled: true,
                  action: () => choosePlan(context),
                  color: secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
