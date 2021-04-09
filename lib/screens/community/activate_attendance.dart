import 'package:fitness/components/avatar.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivateAttendance extends StatefulWidget {
  _ActivateAttendanceState createState() => _ActivateAttendanceState();
}

class _ActivateAttendanceState extends State<ActivateAttendance> {
  List<Member> memberList = [];
  void initState() {
    super.initState();
    memberList = [
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari', isFavorite: true),
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari', isFavorite: true),
      Member(name: 'Ahmad Dosari'),
      Member(name: 'Ahmad Dosari'),
      Member(img: 'exercise-photo1', name: 'Ahmad Dosari'),
    ];
  }

  Widget _buildMemberItem(BuildContext context, int index) {
    var member = memberList[index];

    return Column(
      children: [
        SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            member.img == null
                ? TextAvatar(name: member.name, size: 48)
                : Avatar(image: member.img, size: 48),
            SizedBox(width: 20),
            BlackText(member.name, 15, true),
            Expanded(
              child: SizedBox(),
            ),
            member.isFavorite != null && member.isFavorite
                ? Image(image: getIcon('star'))
                : SizedBox(),
            SizedBox(width: 30),
          ],
        ),
        SizedBox(height: 6),
        Padding(
          padding: mainHrPadding,
          child: Divider(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getWindowHeight(context) * .7,
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackText('ATTENDANCE', 28, true),
          Container(
            height: getWindowHeight(context) * .7 - 200,
            padding: mainHrPadding,
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
