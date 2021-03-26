import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/badge.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/price_text.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/competition.dart';
import 'package:flutter/material.dart';

class CommunityCompetitionScreen extends StatefulWidget {
  _CommunityCompetitionScreenState createState() =>
      _CommunityCompetitionScreenState();
}

class _CommunityCompetitionScreenState
    extends State<CommunityCompetitionScreen> {
  List<Competition> competitionList = [];

  void initState() {
    super.initState();
    competitionList = [
      Competition(img: 'exercise-photo3', name: 'Ahmed Dosari', steps: 9750),
      Competition(img: 'exercise-photo2', name: 'Ali Mohammed', steps: 9650),
      Competition(img: 'exercise-photo1', name: 'Amira Abed Aziz', steps: 8650),
      Competition(img: 'exercise-photo2', name: 'Asad Naser', steps: 4650),
      Competition(img: 'exercise-photo1', name: 'Bander Vari', steps: 3650),
      Competition(img: 'exercise-photo3', name: 'Bilal Sami', steps: 5650),
    ];
    competitionList.sort((a, b) => b.steps.compareTo(a.steps));
  }

  Widget _buildCompetitionItem(BuildContext context, int index) {
    var member = competitionList[index];
    var rank = index + 1;
    var color = rank < 4 ? secondaryColor : primaryColor;

    return Column(
      children: [
        SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              alignment: Alignment.center,
              child: Badge(color: color, value: rank),
            ),
            member.img == null
                ? TextAvatar(name: member.name, size: 48)
                : Avatar(image: member.img, size: 48),
            SizedBox(width: 20),
            BlackText(member.name, 15, true),
            Expanded(
              child: SizedBox(),
            ),
            PriceText(
              mainText: member.steps.toString(),
              subText: ' Steps',
              mainStyle:
                  TextStyle(fontSize: 15, fontWeight: Bold, color: color),
              subStyle: TextStyle(
                  fontSize: 8, fontWeight: FontWeight.w400, color: color),
            ),
            SizedBox(width: 30),
          ],
        ),
        SizedBox(height: 12),
        Padding(
          padding: mainHrPadding,
          child: Divider(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'community',
      pageIndex: 2,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 80,
            padding: mainHrPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: getIcon('flame')),
                SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlackText('Competition Name'.toUpperCase(), 18, true),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'Few Description for this competition Few Descrip tion for this competition Description for this competition ... ',
                          style: TextStyle(fontSize: 12, color: greyTextColor),
                          maxLines: 3,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: competitionList.length,
              itemBuilder: (context, index) {
                return _buildCompetitionItem(context, index);
              },
            ),
          ),
          Container(
            height: 60,
            padding: mainHrPadding,
            alignment: Alignment.center,
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceText(
                  mainText: 'User\'s Ranking ',
                  subText: 'with',
                  mainStyle:
                      TextStyle(color: white, fontWeight: Bold, fontSize: 16),
                  subStyle: TextStyle(color: white, fontSize: 12),
                ),
                Container(
                  height: 28,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: white.withOpacity(.3),
                  ),
                  child: WhiteText('STEPS', 14, true),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
