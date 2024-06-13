import 'package:fitness/components/image_slider.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/requirements.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/activate.dart';
import 'package:fitness/model/require_item.dart';
import 'package:fitness/components/nav_second_bar.dart';
import 'package:fitness/screens/community/activate_attendance.dart';
import 'package:flutter/material.dart';

class CommunityActivateScreen extends StatefulWidget {
  CommunityActivateScreen({
    Key? key, 
    this.active = false
  }) : super(key: key);
  final bool active;
  _CommunityActivatesScreenState createState() =>
      _CommunityActivatesScreenState();
}

class _CommunityActivatesScreenState extends State<CommunityActivateScreen> {
  late Activate _activate;

  void initState() {
    super.initState();
    _activate = Activate(
      name: 'Community Name',
      date: '17-Dec-2020',
      description:
          'Brief description for this Activate description description …',
      isFavorite: true,
      images: [
        'exercise-photo1',
        'exercise-photo2',
        'exercise-photo3',
      ],
    );
  }

  void showAttendance(BuildContext context) {
    showAppBtSheet(context, ActivateAttendance());
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: '',
      child: Column(
        children: [
          ImageSlider(
            images: _activate.images!,
            dotColor: primaryColor,
            titleText: BlackText('Running in the morning', 24, true),
            bulletBottom: true,
          ),
          SizedBox(height: 20),
          Container(
            padding: mainHrPadding,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Image(
                        image: getIcon('calendar'),
                      ),
                      SizedBox(width: 20),
                      BlackText(_activate.date, 14, true),
                      Expanded(child: SizedBox()),
                      GreyText('7 AM - 8 AM', 11, true),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: GreyText(_activate.description, 11),
                ),
                RequirementsBlock(items: [
                  RequireItem(field: 'Running Sneakers', require: true),
                  RequireItem(field: 'Running Clothes', require: true),
                  RequireItem(field: 'Music Player', require: false),
                ])
              ],
            ),
          ),
          SizedBox(height: 20),
          NavSecondBar(
            title: 'Who is Attending',
            prefixIcon: 'user',
            action: () => showAttendance(context),
          ),
          SizedBox(height: 20),
          PrimaryBlockButton(
            label: !widget.active ? 'Join' : 'Leave this activity',
            action: () => {},
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
