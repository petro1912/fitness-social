import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/community_item.dart';
import 'package:fitness/components/community_join.dart';
import 'package:fitness/components/community_search.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/search.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/community.dart';
import 'package:fitness/screens/community/community_items.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Community> communityList = [];

  void initState() {
    super.initState();
    communityList = [
      Community(
          img: 'exercise-photo1',
          name: 'Community Name',
          members: 24,
          topic: 'for gym gear',
          isFavorite: true),
      Community(
          img: 'exercise-photo2',
          name: 'Community Name',
          members: 24,
          topic: 'training and Boxing',
          isFavorite: false),
      Community(
          img: 'exercise-photo3',
          name: 'Community Name',
          members: 24,
          topic: 'cardio and training',
          isFavorite: false),
      Community(
          img: 'exercise-photo1',
          name: 'Community Name',
          members: 24,
          topic: 'for gym gear',
          isFavorite: false),
    ];
  }

  void navCommunityDashboard(BuildContext context) {
    // showAppBtSheet(context, JoinCommunity(comm: communityList[0]));
    // showAppBtSheet(context, SearchCommunity());
    navPush(context, CommunityItemsScreen());
  }

  Widget _buildCommunityItem(BuildContext context, int index) {
    var comm = communityList[index];
    return CommunityItem(comm: comm, action: navCommunityDashboard);
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'community',
      isMain: true,
      pageIndex: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: mainHrPadding,
              child: SearchBox(),
            ),
            Container(
              height: getWindowHeight(context) - 220,
              margin: EdgeInsets.only(top: 10),
              // padding: EdgeInsets.symmetric(
              //   horizontal: 30,
              // ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: communityList.length,
                itemBuilder: (context, index) {
                  return _buildCommunityItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
