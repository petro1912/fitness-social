import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/user.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user;

  void initState() {
    super.initState();
    user = User(
        img: 'exercise-photo1',
        name: 'Mohammed Abed',
        job: 'developer',
        properties: [
          ['Height', '128 cm'],
          ['Weight', '79 kg'],
          ['Gender', 'Male'],
          ['Date of Birth', '19\04\1992'],
        ]);
  }

  Widget _buildProfileItem(int index) {
    const widthBox = SizedBox(width: 15);
    const widthBox2 = SizedBox(width: 30);
    var property = user.properties[index];
    return Container(
      margin: mainHrPadding,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor, width: .5),
        ),
      ),
      child: Row(
        children: [
          widthBox,
          GreyText(property[0], 18),
          widthBox2,
          PrimaryText(property[1], 20),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'view profile',
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
                  user.img != null
                      ? Avatar(image: user.img, size: 100)
                      : TextAvatar(name: user.name, size: 100),
                  SizedBox(
                    width: 20,
                  ),
                  BlackText(user.name, 18, true),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: GreyText(user.job, 12, false, true),
                  ),
                ],
              ),
            ),
            _buildProfileItem(0),
            _buildProfileItem(1),
            _buildProfileItem(2),
            _buildProfileItem(3),
          ],
        ),
      ),
    );
  }
}
