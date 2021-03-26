import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/club.dart';
import 'package:fitness/model/member.dart';
import 'package:flutter/material.dart';

class CommunityClubJoinScreen extends StatefulWidget {
  _CommunityClubJoinScreenState createState() =>
      _CommunityClubJoinScreenState();
}

class _CommunityClubJoinScreenState extends State<CommunityClubJoinScreen> {
  Club club;
  List<Member> memberList = [];

  void initState() {
    super.initState();
    club = Club(
      name: 'Football Club',
      members: 23,
      img: 'exercise-photo1',
      description:
          'Few Description for this club Few Description for this club Description for this club ... ',
      icons: ['swimming', 'boat'],
    );
    memberList = [
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari'),
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari'),
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari'),
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari'),
    ];
  }

  void navCommunityDashboard(BuildContext context) {
    // navPush(context, CommunityClubScreen());
  }

  Widget _buildMemberItem(BuildContext context, int index) {
    var member = memberList[index];
    var clubAvName = club.name.substring(0, 1).toUpperCase();
    return InkWell(
      onTap: () => navCommunityDashboard(context),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: member.img != null
                    ? Avatar(image: club.img, size: 40)
                    : TextAvatar(name: clubAvName, size: 40),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BlackText(member.name, 14, true),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'other clubs',
      pageIndex: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: mainHrPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  club.img != null
                      ? Avatar(image: club.img, size: 100)
                      : TextAvatar(name: club.name, size: 100),
                  SizedBox(
                    width: 20,
                  ),
                  BlackText(club.name.toUpperCase(), 18, true),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: GreyText(club.description, 12, false, true),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      club.icons.length,
                      (idx) => Padding(
                        padding: EdgeInsets.all(4),
                        child: Image(
                          image: getAssetImage(club.icons[idx]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: getWindowHeight(context) - 220,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: memberList.length,
                itemBuilder: (context, index) {
                  return _buildMemberItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
