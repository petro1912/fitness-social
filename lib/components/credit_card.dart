import 'package:fitness/components/credit_card_visa.dart';
import 'package:flutter/material.dart';

class CreditCardView extends StatelessWidget {
  CreditCardView({
    Key key,
    this.cardNumber,
    this.holderName,
    this.expired,
    this.cvv,
  }) : super(key: key);

  final String cardNumber, holderName, expired, cvv;

  Widget build(BuildContext context) {
    return Container(
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
            child: CreditCardVisa(),
          ),
          Container(
            width: 20,
            margin: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: Color(0xFFF7B579),
            ),
          ),
        ],
      ),
    );
  }
}
