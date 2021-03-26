import 'package:fitness/components/credit_text.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class AddPaymentCardScreen extends StatefulWidget {
  _StateAddPaymentCardScreen createState() => _StateAddPaymentCardScreen();
}

class _StateAddPaymentCardScreen extends State<AddPaymentCardScreen> {
  void createCard() {}

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'payment',
      isMain: true,
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          PrimaryText('Add New Card', 16, true),
          CreditTextView(),
          Expanded(child: SizedBox(height: 1)),
          PrimaryBlockButton(
            label: 'Confirm Location',
            action: () => createCard(),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
