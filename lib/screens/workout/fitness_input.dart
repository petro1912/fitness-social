import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/workout/choose_goal.dart';
import 'package:flutter/material.dart';
import 'package:fitness/utils/navigation_util.dart';

class FitnessInputScreen extends StatefulWidget {
  _FitnessInputScreenState createState() => _FitnessInputScreenState();
}

class _FitnessInputScreenState extends State<FitnessInputScreen> {
  int height;
  int weight;
  int day, month, year;

  void chooseGoal(BuildContext context) {
    navPush(context, ChooseGoalScreen());
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'workout',
      isMain: false,
      child: Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          blackText('HEIGHT', 22, true),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              initialValue: '',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: '176 cm', suffix: blackText('cm')),
                              onChanged: (text) => setState(() {
                                height = int.parse(text);
                              }),
                              style: TextStyle(color: textColor, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          blackText('WEIGHT', 22, true),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              initialValue: '',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: '82 kg', suffix: blackText('kg')),
                              onChanged: (text) => setState(() {
                                weight = int.parse(text);
                              }),
                              style: TextStyle(color: textColor, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          blackText('DATE OF BIRTH', 22, true),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 80,
                                child: TextFormField(
                                  initialValue: '',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Day',
                                  ),
                                  onChanged: (text) => setState(() {
                                    day = int.parse(text);
                                  }),
                                  style:
                                      TextStyle(color: textColor, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: TextFormField(
                                  initialValue: '',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Month',
                                  ),
                                  onChanged: (text) => setState(() {
                                    month = int.parse(text);
                                  }),
                                  style:
                                      TextStyle(color: textColor, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  initialValue: '',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Year',
                                  ),
                                  onChanged: (text) => setState(() {
                                    year = int.parse(text);
                                  }),
                                  style:
                                      TextStyle(color: textColor, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: RoundedRaisedButton(
                    label: 'Next',
                    filled: true,
                    action: () => chooseGoal(context),
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
