import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/supplement.dart';
import 'package:flutter/material.dart';

class SupplementsScreen extends StatefulWidget {
  _SupplementsScreenState createState() => _SupplementsScreenState();
}

class _SupplementsScreenState extends State<SupplementsScreen> {
  List<Supplement> supplementList = [];
  @override
  void initState() {
    super.initState();
    supplementList = [
      Supplement(
          img: "assets/images/supp1.png",
          usage: '3 Times Per Day',
          amount: 1,
          isNew: true),
      Supplement(
          img: "assets/images/supp2.png",
          usage: '3 Times Per Day',
          amount: 1,
          isNew: true),
      Supplement(
          img: "assets/images/supp3.png",
          usage: '3 Times Per Day',
          amount: 1,
          isNew: true),
      Supplement(
          img: "assets/images/supp4.png",
          usage: '3 Times Per Day',
          amount: 1,
          isNew: true),
      Supplement(
          img: "assets/images/supp3.png",
          usage: '3 Times Per Day',
          amount: 1,
          isNew: true),
      Supplement(
          img: "assets/images/supp4.png",
          usage: '3 Times Per Day',
          amount: 1,
          isNew: true),
    ];
  }

  void navSupplementDetail(BuildContext context) {
    // navPush(context, SupplementDetailScreen());
  }

  Widget _buildSupplementCard(BuildContext context, int index) {
    Supplement action = supplementList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage(action.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        BlackText(action.usage, 12, true),
        SizedBox(height: 6),
        PrimaryText('${action.amount} Scoop', 10)
      ],
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'supplement',
      pageIndex: 1,
      child: Container(
        width: getWindowWidth(context),
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: supplementList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, index) => _buildSupplementCard(context, index),
        ),
      ),
    );
  }
}
