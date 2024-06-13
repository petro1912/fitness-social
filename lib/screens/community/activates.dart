import 'package:fitness/components/activate_card.dart';
import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/color_dot.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/tabbar.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/activate.dart';
import 'package:fitness/model/tabbar_item.dart';
import 'package:fitness/screens/community/activate.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CommunityActivatesScreen extends StatefulWidget {
  _CommunityActivatesScreenState createState() =>
      _CommunityActivatesScreenState();
}

class _CommunityActivatesScreenState extends State<CommunityActivatesScreen> {
  List<Activate> activateList = [];
  List<Activate> allActivateList = [];

  void initState() {
    super.initState();
    activateList = [
      Activate(
          name: 'Running Every Day',
          date: '17-Dec-2020',
          description:
              'Brief description for this activity description for this acti Brief descry iption for this activity description for this acti',
          isFavorite: true),
      Activate(
          name: 'Ride Bicycle',
          date: '17-Dec-2020',
          description:
              'Brief description for this activity description for this acti Brief descry iption for this activity description for this acti',
          isFavorite: false),
      Activate(
          name: 'Play Cardio',
          date: '17-Dec-2020',
          description:
              'Brief description for this activity description for this acti Brief descry iption for this activity description for this acti',
          isFavorite: false),
    ];

    allActivateList = [
      Activate(
          name: 'Running Every Day',
          date: '17-Dec-2020',
          description:
              'Brief description for this activity description for this acti Brief descry iption for this activity description for this acti',
          img: 'Photo3',
          isFavorite: true),
      Activate(
          name: 'Ride Bicycle',
          date: '17-Dec-2020',
          description:
              'Brief description for this activity description for this acti Brief descry iption for this activity description for this acti',
          img: 'Photo3',
          isFavorite: false),
      Activate(
          name: 'Play Cardio',
          date: '17-Dec-2020',
          description:
              'Brief description for this activity description for this acti Brief descry iption for this activity description for this acti',
          img: 'Photo3',
          isFavorite: false),
    ];
  }

  void navCommunityActivate(BuildContext context, bool active) {
    navPush(context, CommunityActivateScreen(active: active));
  }

  Widget _buildActivateItem(BuildContext context, int index) {
    var activate = activateList[index];
    return InkWell(
      onTap: () => navCommunityActivate(context, true),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: TextAvatar(
                    name: activate.name.substring(0, 1).toUpperCase(),
                    color: primaryColor,
                    size: 40),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          alignment: Alignment.center,
                          child: ColorDot(
                            size: 5,
                            color: activate.isFavorite
                                ? primaryColor
                                : secondaryColor,
                          ),
                        ),
                        BlackText(activate.name, 14, true),
                      ],
                    ),
                    SizedBox(height: 6),
                    Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Text(
                        activate.description,
                        style: TextStyle(
                          fontSize: 10,
                          color: greyTextColor,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              SecondaryText('${activate.date}', 11),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _buildMyActivates() {
    return Container(
      height: getWindowHeight(context) - 220,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: activateList.length,
        itemBuilder: (context, index) {
          return _buildActivateItem(context, index);
        },
      ),
    );
  }

  Widget _buildAllActivates() {
    return Container(
      height: getWindowHeight(context) - 220,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView.builder(
        itemCount: allActivateList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => ActivateCard(
          img: allActivateList[index].img!,
          title: allActivateList[index].name,
          description: allActivateList[index].description,
          date: allActivateList[index].date,
          isFavorite: allActivateList[index].isFavorite,
          action: () => navCommunityActivate(context, false),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'community',
      pageIndex: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20,
            ),
            Tabbar(height: getWindowHeight(context) - 220, items: [
              TabbarItem(label: 'My Activates', page: _buildMyActivates()),
              TabbarItem(label: 'All Activates', page: _buildAllActivates()),
            ]),
          ],
        ),
      ),
    );
  }
}
