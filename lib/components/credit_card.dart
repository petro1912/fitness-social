import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CreditCardView extends StatefulWidget {
  CreditCardView({
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

class _CreditTextState extends State<CreditCardView> {
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
                      initialValue: cardNumber,
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
                      onChanged: (text) => numberChanged(text),
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
                            initialValue: cvv,
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
                            onChanged: (text) => cvvChanged(text),
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
}
