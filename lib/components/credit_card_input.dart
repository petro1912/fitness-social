import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:flutter/material.dart';

class CreditCardInput extends StatefulWidget {
  CreditCardInput({
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

class _CreditTextState extends State<CreditCardInput> {
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
            child: TextFormField(
              initialValue: cardNumber,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Card Number',
                isDense: true,
                hintStyle: TextStyle(color: white, fontWeight: Bold),
                border:
                    UnderlineInputBorder(borderSide: BorderSide(color: white)),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: white)),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: white)),
              ),
              onChanged: (text) => numberChanged(text),
              style: TextStyle(color: white, fontWeight: Bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: SizedBox(height: 1)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    initialValue: cvv,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: strHolderNamePl,
                      isDense: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      hintStyle: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontWeight: Bold),
                    ),
                    onChanged: (text) => cvvChanged(text),
                    style: TextStyle(color: white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    initialValue: cvv,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'CVV',
                      isDense: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      hintStyle: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontWeight: Bold),
                    ),
                    onChanged: (text) => cvvChanged(text),
                    style: TextStyle(color: white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: SizedBox(width: 1)),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    initialValue: cvv,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: '02/22',
                      isDense: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      hintStyle: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontWeight: Bold),
                    ),
                    onChanged: (text) => cvvChanged(text),
                    style: TextStyle(color: white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
