import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/card.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/community.dart';
import 'package:fitness/model/dashboard_item.dart';
import 'package:fitness/screens/community/activates.dart';
import 'package:fitness/screens/community/classes.dart';
import 'package:fitness/screens/community/clubs.dart';
import 'package:fitness/screens/community/competition.dart';
import 'package:fitness/screens/community/dashboard.dart';
import 'package:fitness/screens/community/members.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CommunityItemsScreen extends StatefulWidget {
  _CommunityItemsScreenState createState() => _CommunityItemsScreenState();
}

class _CommunityItemsScreenState extends State<CommunityItemsScreen> {
  late Community comm;
  List<DashboardItem> items = [];

  @override
  void initState() {
    super.initState();
    comm = Community(
      img: 'exercise-photo3',
      name: 'Community Name',
      members: 24,
      topic: 'cardio and training',
      isFavorite: false,
    );
    items = [
      DashboardItem(
        name: 'Members',
        icon: 'member',
        value: '86',
        unit: 'member',
        screen: CommunityMembersScreen(),
      ),
      DashboardItem(
        name: 'Dash Board',
        icon: 'dashboard',
        value: '2.94%',
        unit: '30% Activity Increase',
        screen: CommunityDashboardScreen(),
      ),
      DashboardItem(
        name: 'Competition',
        icon: 'competition',
        value: '42',
        unit: 'Competitors',
        screen: CommunityCompetitionScreen(),
      ),
      DashboardItem(
        name: 'Activates',
        icon: 'activate',
        value: '42',
        unit: 'activates',
        screen: CommunityActivatesScreen(),
      ),
      DashboardItem(
        name: 'Clubs',
        icon: 'club',
        value: '86',
        unit: 'Joined',
        screen: CommunityClubsScreen(),
      ),
      DashboardItem(
        name: 'Classes',
        icon: 'class',
        value: '86',
        unit: 'Classes',
        screen: CommunityClassesScreen(),
      ),
    ];
  }

  void navDetailPage(BuildContext context, int index) {
    navPush(context, items[index].screen);
  }

  Widget _buildCommunityItem(int index) {
    var item = items[index];

    return Expanded(
      child: InkWell(
        onTap: () => navDetailPage(context, index),
        child: RRCard(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreyText(item.name, 10, true),
              Container(
                alignment: Alignment.center,
                height: 120,
                child: Image(
                  image: getIcon(item.icon),
                ),
              ),
              BlackText(item.value, 12, true),
              SizedBox(height: 6),
              GreyText(item.unit, 9, true)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'community',
      pageIndex: 2,
      child: Container(
        padding: mainHrPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText('${comm.name}'.toUpperCase(), 24, true),
                    SizedBox(height: 6),
                    GreyText('${comm.members} member', 12),
                  ],
                ),
                Avatar(image: comm.img, size: 87),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                _buildCommunityItem(0),
                SizedBox(width: 20),
                _buildCommunityItem(1),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildCommunityItem(2),
                SizedBox(width: 20),
                _buildCommunityItem(3),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildCommunityItem(4),
                SizedBox(width: 20),
                _buildCommunityItem(5),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
