import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/club_card.dart';
import 'package:fitness/components/tabbar.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/club.dart';
import 'package:fitness/model/tabbar_item.dart';
import 'package:fitness/screens/community/club.dart';
import 'package:fitness/screens/community/club_join.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CommunityClubsScreen extends StatefulWidget {
  _CommunityClubsScreenState createState() => _CommunityClubsScreenState();
}

class _CommunityClubsScreenState extends State<CommunityClubsScreen> {
  List<Club> clubList = [];
  List<Club> allClubList = [];

  void initState() {
    super.initState();
    clubList = [
      Club(
        name: 'Football Club',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        members: 18,
      ),
      Club(
        name: 'Football Club',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        members: 18,
      ),
      Club(
        name: 'Football Club',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        members: 18,
      ),
      Club(
        name: 'Football Club',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        members: 18,
      ),
      Club(
        name: 'Football Club',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        members: 18,
      ),
      Club(
        name: 'Football Club',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        members: 18,
      ),
    ];
    allClubList = [
      Club(
        name: 'Football Club',
        img: 'Photo1',
        members: 23,
      ),
      Club(
        name: 'Basketball Club',
        img: 'Photo2',
        members: 18,
      ),
      Club(
        name: 'Basketball Club',
        img: 'Photo3',
        members: 18,
      ),
    ];
  }

  void navClubItem(BuildContext context) {
    navPush(context, CommunityClubScreen());
  }

  Widget _buildMyClubItem(BuildContext context, int index) {
    var club = clubList[index];
    var clubAvName = club.name.substring(0, 1).toUpperCase();
    return InkWell(
      onTap: () => navClubItem(context),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: club.img != null
                    ? Avatar(image: club.img, size: 40)
                    : TextAvatar(
                        name: clubAvName, color: primaryColor, size: 40),
              ),
              Expanded(
                child: BlackText(club.name, 14, true),
              ),
              SizedBox(width: 30),
              SecondaryText('${club.members} Members', 11),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _buildMyClubs() {
    return Container(
      height: getWindowHeight(context) - 220,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: clubList.length,
        itemBuilder: (context, index) {
          return _buildMyClubItem(context, index);
        },
      ),
    );
  }

  Widget _buildAllClubs() {
    return Container(
      height: getWindowHeight(context) - 220,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          mainAxisSpacing: 30,
        ),
        itemCount: allClubList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => ClubCard(
          img: allClubList[index].img,
          title: allClubList[index].name,
          subtitle: '${allClubList[index].members} Members',
          action: () => navPush(context, CommunityClubJoinScreen()),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'clubs',
      pageIndex: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 10,
            ),
            Tabbar(height: getWindowHeight(context) - 220, items: [
              TabbarItem(label: 'My Clubs', page: _buildMyClubs()),
              TabbarItem(label: 'All Clubs', page: _buildAllClubs()),
            ]),
          ],
        ),
      ),
    );
  }
}
