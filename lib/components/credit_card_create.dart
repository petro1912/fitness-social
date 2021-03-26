import 'package:fitness/components/credit_card_visa.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CreditCardCreate extends StatefulWidget {
  CreditCardCreate({
    Key key,
    this.cardNumber,
    this.expired,
    this.cvv,
    this.numberChanged,
    this.expiredChanged,
    this.cvvChanged,
  }) : super(key: key);

  final String cardNumber, expired, cvv;
  final Function numberChanged, expiredChanged, cvvChanged;

  _CreditTextState createState() => _CreditTextState();
}

class _CreditTextState extends State<CreditCardCreate> {
  String cardNumber, expired, cvv;

  void initState() {
    super.initState();
    setState(() {
      cardNumber = widget.cardNumber ?? '';
      expired = widget.expired ?? '';
      cvv = widget.cvv ?? '';
    });
  }

  void numberChanged(text) {
    setState(() {
      cardNumber = text;
    });

    if (widget.numberChanged != null) widget.numberChanged(text);
  }

  void expiredChanged(text) {
    setState(() {
      expired = text;
    });

    if (widget.expiredChanged != null) widget.expiredChanged(text);
  }

  void cvvChanged(text) {
    setState(() {
      cvv = text;
    });

    if (widget.cvvChanged != null) widget.cvvChanged(text);
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
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                color: primaryColor.withOpacity(.3),
                child: WhiteText('+', 24, true),
              ),
            ),
          ),
          SizedBox(width: 16),
          /* DottedBorder(
  borderType: BorderType.RRect,
  radius: Radius.circular(12),
  padding: EdgeInsets.all(6),
  child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    child: Container(
      height: 40,
      width: 40,
      color: primaryColor.withOpacity(.6),
    ),
  ),
), */
        ],
      ),
    );
  }
}
