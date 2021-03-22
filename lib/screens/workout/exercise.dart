import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/exercise.dart';
import 'package:fitness/model/goal_action.dart';
import 'package:fitness/screens/workout/goal_action_detail.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List<Exercise> ExerciseList = [];
  @override
  void initState() {
    super.initState();
    ExerciseList = [
      Exercise(
        img: "assets/images/Photo1.png",
        name: 'Name Of The Exercise 002',
        sessions: 4,
        laps: 22,
      ),
      Exercise(
        img: "assets/images/Photo1.png",
        name: 'Name Of The Exercise 002',
        sessions: 6,
        laps: 24,
      ),
      Exercise(
        img: "assets/images/Photo1.png",
        name: 'Name Of The Exercise 002',
        sessions: 3,
        laps: 12,
      ),
      Exercise(
        img: "assets/images/Photo1.png",
        name: 'Name Of The Exercise 002',
        sessions: 4,
        laps: 8,
      ),
      Exercise(
        img: "assets/images/Photo1.png",
        name: 'Name Of The Exercise 002',
        sessions: 4,
        laps: 22,
      ),
      Exercise(
        img: "assets/images/Photo1.png",
        name: 'Name Of The Exercise 002',
        sessions: 4,
        laps: 22,
      ),
    ];
  }

  void navExerciseDetail(BuildContext context) {
    // navPush(context, ExerciseDetailScreen());
  }

  Widget _buildExerciseCard(BuildContext context, int index) {
    Exercise action = ExerciseList[index];
    return InkWell(
      onTap: () => navExerciseDetail(context),
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(action.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackText(action.name, 16, true),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          primaryText('${action.sessions} Sessions', 12),
                          secondaryText('${action.laps} laps', 12),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 12),
          Divider(height: 1),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'exercise',
      child: Container(
        width: getWindowWidth(context),
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: ExerciseList.length,
          itemBuilder: (context, index) {
            return _buildExerciseCard(context, index);
          },
        ),
      ),
    );
  }
}
