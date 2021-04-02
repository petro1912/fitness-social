import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/swiper.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/diary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DiaryScreen extends StatefulWidget {
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  int _currentIndex = 0;
  bool recording = false;
  List<Diary> weekDiary;
  int weight;

  void initState() {
    super.initState();
    weekDiary = [
      Diary(img: 'club-item3', weight: 83, bmi: 25),
      Diary(img: 'club-item2', weight: 82, bmi: 27),
      Diary(img: 'club-item1', weight: 82, bmi: 27),
      Diary(img: 'club-item3', weight: 81, bmi: 28),
      Diary(img: 'club-item2', weight: 80, bmi: 29),
    ];
  }

  void onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildWeeksPhoto(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10)),
      child: Image(
        image: getAssetImage(weekDiary[index].img),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildWeeksWeight(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10)),
      child: Container(
        color: primaryColor,
        alignment: Alignment.center,
        child: WhiteText('${weekDiary[index].weight} kg'),
      ),
    );
  }

  Widget _buildWeeksBMI(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10)),
      child: Container(
        color: secondaryColor,
        alignment: Alignment.center,
        child: WhiteText('${weekDiary[index].bmi}'),
      ),
    );
  }

  Widget _buildWeeklyDiary() {
    return Column(
      children: [
        SizedBox(height: 20),
        SwiperSlider(
          index: _currentIndex,
          onIndexChanged: onIndexChanged,
          itemWidth: 200,
          itemHeight: 200,
          itemCount: weekDiary.length,
          itemBuilder: _buildWeeksPhoto,
        ),
        SizedBox(height: 14),
        Divider(),
        SizedBox(height: 14),
        BlackText('This Week\'s Weight', 14),
        SizedBox(height: 14),
        SwiperSlider(
          index: _currentIndex,
          onIndexChanged: onIndexChanged,
          itemWidth: 80,
          itemHeight: 40,
          itemCount: weekDiary.length,
          itemBuilder: _buildWeeksWeight,
        ),
        SizedBox(height: 14),
        Divider(),
        SizedBox(height: 14),
        BlackText('BMI', 14),
        SizedBox(height: 14),
        SwiperSlider(
          index: _currentIndex,
          onIndexChanged: onIndexChanged,
          itemWidth: 80,
          itemHeight: 40,
          itemCount: weekDiary.length,
          itemBuilder: _buildWeeksBMI,
        ),
      ],
    );
  }

  Widget _buildRecordDiary() {
    return Column(
      children: [
        SizedBox(height: 20),
        SwiperSlider(
          index: _currentIndex,
          onIndexChanged: onIndexChanged,
          itemWidth: 200,
          itemHeight: 200,
          itemCount: weekDiary.length,
          itemBuilder: _buildWeeksPhoto,
        ),
        SizedBox(height: 14),
        Divider(),
        SizedBox(height: 14),
        BlackText('This Week\'s Weight', 14),
        SizedBox(height: 14),
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
        SizedBox(height: 14),
        Divider(),
        SizedBox(height: 14),
        BlackText('BMI', 14),
        SizedBox(height: 14),
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
        ],
      ),
    );
  }
}
