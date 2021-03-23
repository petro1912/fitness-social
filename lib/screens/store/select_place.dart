import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/store/payment.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class SelectPlaceScreen extends StatefulWidget {
  SelectPlaceScreen({Key key, this.title}) : super(key: key);
  final String title;

  _SelectPlaceScreenState createState() => _SelectPlaceScreenState();
}

class _SelectPlaceScreenState extends State<SelectPlaceScreen> {
  void confirmLocation(BuildContext context) {
    navPush(context, PaymentScreen());
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'checkout',
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: primaryColor.withOpacity(.1),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: PrimaryBlockButton(
              label: 'Confirm Location',
              action: () => confirmLocation(context),
            ),
          )
        ],
      ),
    );
  }
}
