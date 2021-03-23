import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/radio_group.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'payment',
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              blackText(strStorePaymentPl, 14, true),
              greyText(strStorePayPackagePl, 12),
              Divider(),
              RadioGroup(groupItems: [
                GroupItem(name: 'Pay with Card', icon: 'pay-card'),
                GroupItem(name: 'Pay with Apple Pay', icon: 'pay-apple'),
                GroupItem(name: 'Pay with Cash', icon: 'pay-cash'),
              ]),
            ],
          ),
        )
      ]),
    );
  }
}
