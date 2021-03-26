import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/diet.dart';
import 'package:flutter/material.dart';

class DietsScreen extends StatefulWidget {
  _DietsScreenState createState() => _DietsScreenState();
}

class _DietsScreenState extends State<DietsScreen> {
  List<Diet> dietList = [];
  @override
  void initState() {
    super.initState();
    dietList = [
      Diet(
        img: "assets/images/exercise-photo1.png",
        name: 'HEALTHY CHICKEN',
        kcal: 350,
        ingredients: ['Chicken Breast', 'Eggs'],
        condiments: ['0.2kg Chees', '0.2kg Brocoli'],
      ),
      Diet(
        img: "assets/images/exercise-photo2.png",
        name: 'HEALTHY CHICKEN',
        kcal: 350,
        ingredients: ['Chicken Breast', 'Eggs'],
        condiments: ['0.2kg Chees', '0.2kg Brocoli'],
      ),
      Diet(
        img: "assets/images/exercise-photo3.png",
        name: 'HEALTHY CHICKEN',
        kcal: 350,
        ingredients: ['Chicken Breast', 'Eggs'],
        condiments: ['0.2kg Chees', '0.2kg Brocoli'],
      ),
      Diet(
        img: "assets/images/exercise-photo4.png",
        name: 'HEALTHY CHICKEN',
        kcal: 350,
        ingredients: ['Chicken Breast', 'Eggs'],
        condiments: ['0.2kg Chees', '0.2kg Brocoli'],
      ),
    ];
  }

  void navDietDetail(BuildContext context) {
    // navPush(context, DietDetailScreen());
  }
  List<Widget> _buildDietContent(index) {
    Diet action = dietList[index];
    List<Widget> contents = [];
    contents.add(BlackText(action.name.toUpperCase(), 16, true));
    contents.add(SizedBox(height: 6));
    for (var i = 0; i < action.ingredients.length; i++) {
      contents.add(BlackText('${i + 1} ${action.ingredients[i]}', 12));
      contents.add(SizedBox(height: 6));
    }
    for (var i = 0; i < action.ingredients.length; i++) {
      contents.add(BlackText(action.condiments[i], 12));
      contents.add(SizedBox(height: 6));
    }
    return contents;
  }

  Widget _buildDietCard(BuildContext context, int index) {
    Diet action = dietList[index];
    return InkWell(
      onTap: () => navDietDetail(context),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 130,
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: textColor.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 12,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildDietContent(index),
              ),
            ),
            SizedBox(width: 20),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(action.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PrimaryText('${action.kcal} Calories', 10, true),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'diet',
      pageIndex: 1,
      child: Container(
        width: getWindowWidth(context),
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: dietList.length,
          itemBuilder: (context, index) {
            return _buildDietCard(context, index);
          },
        ),
      ),
    );
  }
}
