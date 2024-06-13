import 'package:dotted_border/dotted_border.dart';
import 'package:fitness/components/credit_card_visa.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CreditCardCreate extends StatefulWidget {
  CreditCardCreate({Key? key, this.cardNumber, this.expired, this.cvv})
      : super(key: key);

  final String? cardNumber, expired, cvv;

  _CreditTextState createState() => _CreditTextState();
}

class _CreditTextState extends State<CreditCardCreate> {
  late String cardNumber, expired, cvv;

  void initState() {
    super.initState();
    setState(() {
      cardNumber = widget.cardNumber ?? '';
      expired = widget.expired ?? '';
      cvv = widget.cvv ?? '';
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          Expanded(child: CreditCardVisa()),
          GestureDetector(
            onTap: () => {},
            child: DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 1.5,
              dashPattern: [6, 2],
              padding: EdgeInsets.all(1),
              color: primaryColor,
              radius: Radius.circular(12),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  color: primaryColor.withOpacity(.3),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
