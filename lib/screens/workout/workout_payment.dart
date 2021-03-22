import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/round_checkbox.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/screens/workout/goal_action_run.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class WorkoutPaymentScreen extends StatefulWidget {
  _WorkoutPaymentScreenState createState() => _WorkoutPaymentScreenState();
}

class _WorkoutPaymentScreenState extends State<WorkoutPaymentScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String cardNumber;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void purchasePlan(BuildContext context) {
    navPush(context, GoalActionRunScreen());
  }

  Widget _buildTabBarViewText() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          blackText('Card Number', 14, true),
          TextFormField(
            initialValue: '',
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Card number',
              suffixIcon:
                  Image(image: AssetImage('assets/images/mastercard.png')),
            ),
            onChanged: (text) => setState(() {
              cardNumber = text;
            }),
            style: TextStyle(color: textColor),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blackText('Expired Date', 14, true),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'MM/YY',
                      ),
                      onChanged: (text) => setState(() {
                        cardNumber = text;
                      }),
                      style: TextStyle(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blackText('CVV', 14, true),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'CVV',
                      ),
                      onChanged: (text) => setState(() {
                        cardNumber = text;
                      }),
                      style: TextStyle(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTabBarCreditCard(BuildContext context) {
    double width = getWindowWidth(context);

    return Container(
      /* height: , */
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20,
            margin: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color(0xFFF5003C)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/visa.png'),
                    fit: BoxFit.contain),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 45),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Card Number',
                        hintStyle: TextStyle(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                      onChanged: (text) => setState(() {
                        // phoneNumber = text;
                      }),
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        whiteText('Ahmed Abed ElAziz', 12, true),
                        SizedBox(
                          width: 60,
                          child: TextFormField(
                            initialValue: '',
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'CVV',
                              hintStyle: TextStyle(
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            onChanged: (text) => setState(() {
                              // phoneNumber = text;
                            }),
                            style: TextStyle(color: white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 20,
            margin: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Color(0xFFF7B579)),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'workout',
      child: Container(
        width: getWindowWidth(context),
        /* margin: EdgeInsets.symmetric(
          horizontal: 30,
        ), */
        child: Column(
          children: [
            SizedBox(height: 20),
            blackText(strPaymentPlaceholder, 16, false, true),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                primaryText('20 SAR', 28, true),
                SizedBox(width: 10),
                blackText('per month', 28, true)
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: secondaryColor,
                  ),
                  insets: EdgeInsets.only(left: 0, right: 80, bottom: 4),
                ),
                labelColor: textColor,
                labelPadding: EdgeInsets.all(0),
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'TEXT'),
                  Tab(text: 'VISA'),
                  Tab(text: 'MASTERCARD'),
                ],
                controller: _tabController,
              ),
            ),
            Expanded(
              flex: 4,
              child: TabBarView(
                children: [
                  _buildTabBarViewText(),
                  _buildTabBarCreditCard(context),
                  Text('Person'),
                ],
                controller: _tabController,
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundCheckbox(),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(height: 1),
                        SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            text: 'Try Out The Service For Free \nFor ',
                            style: TextStyle(color: textColor, fontSize: 14),
                            children: [
                              TextSpan(
                                text: '30 Days',
                                style: TextStyle(
                                    color: secondaryColor, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Divider(height: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            /* Expanded(child: SizedBox(height: 1)), */
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SizedBox(
                width: double.infinity,
                child: RoundedRaisedButton(
                  label: 'Proceed',
                  filled: true,
                  action: () => purchasePlan(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
