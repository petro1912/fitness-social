import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CreditTextView extends StatefulWidget {
  CreditTextView({
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

class _CreditTextState extends State<CreditTextView> {
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
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          BlackText('Card Number', 14, true),
          TextFormField(
            initialValue: cardNumber,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Card number',
              suffixIcon:
                  Image(image: AssetImage('assets/images/mastercard.png')),
            ),
            onChanged: (text) => numberChanged(text),
            style: TextStyle(color: textColor),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlackText('Expired Date', 14, true),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      initialValue: expired,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'MM/YY',
                      ),
                      onChanged: (text) => expiredChanged(text),
                      style: TextStyle(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlackText('CVV', 14, true),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      initialValue: cvv,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'CVV',
                      ),
                      onChanged: (text) => cvvChanged(text),
                      style: TextStyle(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
