import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/search.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/member.dart';
import 'package:fitness/screens/community/members_chat.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CommunityMembersScreen extends StatefulWidget {
  _CommunityMembersScreenState createState() => _CommunityMembersScreenState();
}

class _CommunityMembersScreenState extends State<CommunityMembersScreen> {
  List<Member> memberList = [];

  void initState() {
    super.initState();
    memberList = [
      Member(name: 'Bander Vari'),
      Member(name: 'Ahmed Dosari'),
      Member(name: 'Ali Mohammed'),
      Member(name: 'Abed el Aziz Barod'),
      Member(name: 'Asad Naser', img: 'exercise-photo1'),
      Member(name: 'Bilal Sami'),
      Member(name: 'Bilal Basil'),
    ];
    memberList.sort((a, b) => a.name.compareTo(b.name));
  }

  bool isFirstInAlphabetic(String name, String nIndex) {
    var subList = memberList
        .where((member) =>
            member.name.toLowerCase().startsWith(nIndex.toLowerCase()))
        .toList();
    return subList[0].name == name;
  }

  void navMemberChatPage(BuildContext context) {
    navPush(context, CommunityChatScreen());
  }

  Widget _buildMemberItem(BuildContext context, int index) {
    var member = memberList[index];
    var name = member.name;
    var nIndex = name.substring(0, 1);
    return InkWell(
      onTap: () => navMemberChatPage(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            alignment: Alignment.topCenter,
            child: isFirstInAlphabetic(name, nIndex)
                ? GreyText(nIndex, 16, true)
                : SizedBox(),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 8),
                Row(
                  children: [
                    member.img == null
                        ? TextAvatar(name: member.name, size: 48)
                        : Avatar(image: member.img, size: 48),
                    SizedBox(width: 20),
                    BlackText(member.name, 15, true)
                  ],
                ),
                SizedBox(height: 8),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'community',
      pageIndex: 2,
      child: Column(
        children: [
          Padding(
            padding: mainHrPadding,
            child: SearchBox(hint: 'Search for new gear...'),
          ),
          Container(
            height: getWindowHeight(context) - 220,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(right: 30),
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
    );
  }
}
