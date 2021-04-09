import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/club_card.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/tabbar.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/class.dart';
import 'package:fitness/model/class.dart';
import 'package:fitness/model/tabbar_item.dart';
import 'package:fitness/screens/community/class.dart';
// import 'package:fitness/screens/community/other_class.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CommunityClassesScreen extends StatefulWidget {
  _CommunityClassesScreenState createState() => _CommunityClassesScreenState();
}

class _CommunityClassesScreenState extends State<CommunityClassesScreen> {
  List<Class> classList = [];
  List<Class> allClassList = [];

  void initState() {
    super.initState();
    classList = [
      Class(
        name: 'Boxing Class',
        description:
            'Few Description for this cls Few Description for this cls Description for this cls ... ',
        type: 'Beginner',
        next: 'Next',
        when: 'Monday',
      ),
      Class(
        name: 'Yoga Class',
        description:
            'Few Description for this cls Few Description for this cls Description for this cls ... ',
        type: 'Advance',
        next: 'Next',
        when: 'Tonight',
      ),
      Class(
        name: 'Boxing Class',
        description:
            'Few Description for this cls Few Description for this cls Description for this cls ... ',
        type: 'Beginner',
        next: 'Next',
        when: 'Monday',
      ),
      Class(
        name: 'Yoga Class',
        description:
            'Few Description for this cls Few Description for this cls Description for this cls ... ',
        type: 'Advance',
        next: 'Next',
        when: 'Tonight',
      ),
    ];
    allClassList = [
      Class(
        name: 'Football Club',
        img: 'Photo1',
        next: 'Next',
        when: 'Tonight',
      ),
      Class(
        name: 'Basketball Club',
        img: 'Photo2',
        next: 'Next',
        when: 'Tonight',
      ),
      Class(
        name: 'Basketball Club',
        img: 'Photo3',
        next: 'Next',
        when: 'Tonight',
      ),
    ];
  }

  void navClassItem(BuildContext context, bool active) {
    navPush(context, CommunityClassScreen(active: active));
  }

  Widget _buildMyClassItem(BuildContext context, int index) {
    var cls = classList[index];
    var clsAvName = cls.name.substring(0, 1).toUpperCase();
    return InkWell(
      onTap: () => navClassItem(context, true),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cls.img != null
                  ? Avatar(image: cls.img, size: 40)
                  : TextAvatar(name: clsAvName, color: primaryColor, size: 40),
              SizedBox(width: 14),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlackText(cls.name, 14, true),
                      SizedBox(height: 2),
                      PrimaryText(cls.type, 9, true),
                      SizedBox(height: 6),
                      GreyText(cls.description, 8),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GreyText(cls.next, 9, true),
                    SecondaryText(cls.when, 10, true),
                  ],
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _buildMyClasses() {
    return Container(
      height: getWindowHeight(context) - 220,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: classList.length,
        itemBuilder: (context, index) {
          return _buildMyClassItem(context, index);
        },
      ),
    );
  }

  Widget _buildAllClasses() {
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
        itemCount: allClassList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => ClubCard(
          img: allClassList[index].img,
          title: allClassList[index].name,
          subtitle: '${allClassList[index].next} ${allClassList[index].when}',
          action: () => navClassItem(context, false),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'classes',
      pageIndex: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 10,
            ),
            Tabbar(height: getWindowHeight(context) - 220, items: [
              TabbarItem(label: 'My Classes', page: _buildMyClasses()),
              TabbarItem(label: 'All Classes', page: _buildAllClasses()),
            ]),
          ],
        ),
      ),
    );
  }
}
