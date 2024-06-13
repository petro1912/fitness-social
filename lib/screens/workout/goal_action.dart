import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/goal_action.dart';
import 'package:fitness/screens/workout/goal_action_detail.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class GoalActionScreen extends StatefulWidget {
  _GoalActionScreenState createState() => _GoalActionScreenState();
}

class _GoalActionScreenState extends State<GoalActionScreen> {
  late List<GoalAction> goalActionList = [];
  @override
  void initState() {
    super.initState();
    goalActionList = [
      GoalAction(
          imgUrl: "assets/images/Photo1.png",
          title: 'Cardio Sessions',
          members: 12,
          description:
              'Brief description for this activity description for this acti Brief descry iption .. '),
      GoalAction(
          imgUrl: "assets/images/Photo2.png",
          title: 'Walking Team',
          members: 10,
          description:
              'Brief description for this activity description for this acti Brief descry iption .. '),
      GoalAction(
          imgUrl: "assets/images/Photo3.png",
          title: 'Learn Boxing ..',
          members: 23,
          description:
              'Brief description for this activity description for this acti Brief descry iption .. '),
      GoalAction(
          imgUrl: "assets/images/Photo1.png",
          title: 'Cardio Sessions',
          members: 12,
          description:
              'Brief description for this activity description for this acti Brief descry iption .. '),
      GoalAction(
          imgUrl: "assets/images/Photo2.png",
          title: 'Walking Team',
          members: 10,
          description:
              'Brief description for this activity description for this acti Brief descry iption .. '),
      GoalAction(
          imgUrl: "assets/images/Photo3.png",
          title: 'Learn Boxing ..',
          members: 23,
          description:
              'Brief description for this activity description for this acti Brief descry iption .. '),
    ];
  }

  void navGoalActionDetail(BuildContext context) {
    navPush(context, GoalActionDetailScreen());
  }

  Widget _buildGoalActionCard(BuildContext context, int index) {
    GoalAction action = goalActionList[index];
    return InkWell(
      onTap: () => navGoalActionDetail(context),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 120,
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: textColor.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 12,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(action.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PrimaryText('Advance', 10, true),
                )
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlackText(action.title, 16, true),
                  SizedBox(height: 6),
                  SecondaryText('${action.members} Member', 10),
                  SizedBox(height: 6),
                  GreyText(action.description, 10),
                ],
              ),
            ),
            SizedBox(width: 20),
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
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: goalActionList.length,
          itemBuilder: (context, index) {
            return _buildGoalActionCard(context, index);
          },
        ),
      ),
    );
  }
}
