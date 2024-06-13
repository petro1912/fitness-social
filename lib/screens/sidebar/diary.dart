import 'dart:io';

import 'package:fitness/components/gallery.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/diary.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  DiaryScreen({Key? key, this.editMode = false, this.dailyImg = ""}) : super(key: key);
  final bool editMode;
  final String dailyImg;
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  int _currentIndex = 0;
  bool recording = false;
  late List<Diary> weekDiary;
  late int weight;
  late String dailyImg;

  void initState() {
    super.initState();
    setState(() {
      weekDiary = [
        Diary(img: 'club-item3', weight: 83, bmi: 25),
        Diary(img: 'club-item2', weight: 82, bmi: 27),
        Diary(img: 'club-item1', weight: 82, bmi: 27),
        Diary(img: 'club-item3', weight: 81, bmi: 28),
        Diary(img: 'club-item2', weight: 80, bmi: 29),
      ];
      recording = widget.editMode;
      dailyImg = widget.dailyImg;
    });
  }

  void onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildWeeksPhoto(Diary diary) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10)),
      child: Image(
        image: getAssetImage(diary.img),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildWeeksWeight(Diary diary) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10)),
      child: Container(
        color: primaryColor,
        alignment: Alignment.center,
        child: WhiteText('${diary.weight} kg'),
      ),
    );
  }

  Widget _buildWeeksBMI(Diary diary) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10)),
      child: Container(
        color: secondaryColor,
        alignment: Alignment.center,
        child: WhiteText('${diary.bmi}'),
      ),
    );
  }

  Widget _buildWeeklyDiary() {
    return Column(
      children: [
        SizedBox(height: 20),
        // SizedBox(
        //   height: 200,
        //   child: OverlappedCarousel(
        //     widgets: weekDiary
        //               .map((item) => _buildWeeksPhoto(item))
        //               .toList(), //List of widgets
        //     currentIndex: 2,
        //     onClicked: onIndexChanged,
        //     obscure: 0.4,
        //     skewAngle: 0.25,
        //   ),
        // ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        BlackText('This Week\'s Weight', 14),
        SizedBox(height: 10),
        // SizedBox(
        //   height: 40,
        //   child: OverlappedCarousel(
        //     widgets: weekDiary
        //               .map((item) => _buildWeeksWeight(item))
        //               .toList(), //List of widgets
        //     currentIndex: 2,
        //     onClicked: onIndexChanged,
        //     obscure: 0.4,
        //     skewAngle: 0.25,
        //   ),
        // ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        BlackText('BMI', 14),
        SizedBox(height: 10),
        // SizedBox(
        //   height: 40,
        //   child: OverlappedCarousel(
        //     widgets: weekDiary
        //               .map((item) => _buildWeeksBMI(item))
        //               .toList(), //List of widgets
        //     currentIndex: 2,
        //     onClicked: onIndexChanged,
        //     obscure: 0.4,
        //     skewAngle: 0.25,
        //   ),
        // ),
      ],
    );
  }

  Widget _buildTakePhoto() {
    return GestureDetector(
      onTap: () => navPush(context, GalleryPage()),
      child: Container(
        width: 180,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.center,
              height: 230,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
                color: white,
              ),
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: primaryColor),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primaryColor,
              ),
              child: WhiteText('Take Your Weekly Photo', 11),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDailyPhoto() {
    return GestureDetector(
      onTap: () => navPush(context, GalleryPage()),
      child: Image.file(
        File(dailyImg),
        width: getWindowWidth(context) * .5,
      ),
    );
  }

  Widget _buildRecordDiary() {
    return Column(
      children: [
        SizedBox(height: 20),
        dailyImg == null ? _buildTakePhoto() : _buildDailyPhoto(),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        BlackText('This Week\'s Weight', 14),
        SizedBox(height: 10),
        SizedBox(
          width: 100,
          child: TextFormField(
            initialValue: '',
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '82 kg',
              hintStyle: TextStyle(color: greyTextColor, fontSize: 20),
              suffix: BlackText('kg'),
            ),
            onChanged: (text) => setState(() {
              weight = int.parse(text);
            }),
            style: TextStyle(color: primaryColor, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        BlackText('BMI', 14),
        SizedBox(height: 10),
        SizedBox(
          width: 100,
          child: TextFormField(
            initialValue: '',
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '25',
              hintStyle: TextStyle(color: greyTextColor, fontSize: 20),
            ),
            onChanged: (text) => setState(() {
              weight = int.parse(text);
            }),
            style: TextStyle(color: primaryColor, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void recordDiary() {
    setState(() {
      recording = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'personal diary',
      pageIndex: 1,
      child: Column(
        children: [
          Container(
            padding: mainHrPadding,
            child: recording ? _buildRecordDiary() : _buildWeeklyDiary(),
          ),
          SizedBox(height: 40),
          recording
              ? PrimaryBlockButton(label: 'Record', action: recordDiary)
              : PrimaryBlockButton(
                  label: 'Add to the Diary',
                  action: () => setState(() {
                    recording = true;
                  }),
                ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
