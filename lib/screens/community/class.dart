import 'package:fitness/components/image_slider.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/requirements.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/class.dart';
import 'package:fitness/model/require_item.dart';
import 'package:fitness/components/nav_second_bar.dart';
import 'package:flutter/material.dart';

class CommunityClassScreen extends StatefulWidget {
  CommunityClassScreen({Key? key, this.active = false}) : super(key: key);
  final bool active;
  _CommunityClasssScreenState createState() => _CommunityClasssScreenState();
}

class _CommunityClasssScreenState extends State<CommunityClassScreen> {
  late Class _cls;
  void initState() {
    super.initState();
    _cls = Class(
      name: 'Boxing Class',
      date: '17-Dec-2020',
      period: '7 AM - 8 AM',
      description:
          'Brief description for this activity .. Brief description for this activity .. Brief description for this activity .. Brief description for this activity .. Brief description for this activity .. Brief description for this activity .. ',
      type: 'Beginner',
      images: [
        'exercise-photo1',
        'exercise-photo2',
        'exercise-photo3',
      ],
    );
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: _cls.name,
      pageIndex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(
            images: _cls.images!,
            dotColor: primaryColor,
            titleText: BlackText(_cls.name, 24, true),
            bulletBottom: true,
          ),
          Padding(
            padding: mainHrPadding,
            child: PrimaryText(_cls.type!, 12, true),
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
                      BlackText(_cls.date!, 14, true),
                      Expanded(child: SizedBox()),
                      GreyText(_cls.period!, 11, true),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    _cls.description!,
                    style: TextStyle(fontSize: 11, color: greyTextColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          NavSecondBar(
            title: 'TB Building, Tahlia Street, Riyadh',
            titleActive: true,
            prefixIcon: 'send',
          ),
          SizedBox(height: 20),
          Container(
            padding: mainHrPadding,
            child: Column(
              children: [
                RequirementsBlock(items: [
                  RequireItem(field: 'Boxing Kit', require: true),
                  RequireItem(field: 'Boxing Clothes', require: true),
                  RequireItem(field: 'Water Bottle', require: false),
                ])
              ],
            ),
          ),
          SizedBox(height: 20),
          PrimaryBlockButton(
            label: !widget.active ? 'Join' : 'Not attending',
            action: () => {},
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
