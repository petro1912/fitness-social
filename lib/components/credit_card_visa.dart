import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CreditCardVisa extends StatelessWidget {
  CreditCardVisa({
    Key key,
    this.cardNumber,
    this.holderName,
    this.expired,
    this.cvv,
  }) : super(key: key);

  final String cardNumber, holderName, expired, cvv;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/visa.png'), fit: BoxFit.contain),
      ),
      child: Column(
        children: [
          SizedBox(height: 60),
          Expanded(child: SizedBox(height: 1)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: WhiteText(cardNumber ?? '5560  1209  0987  4312', 16, true),
          ),
          SizedBox(height: 10),
          Expanded(child: SizedBox(height: 1)),
          Container(
            padding: mainHrPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WhiteText(holderName ?? 'Ahmed Abed ElAziz', 12, true),
                WhiteText(cvv ?? 'cvv', 12, true),
              ],
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
