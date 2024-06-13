import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  PriceText({
    Key? key,
    required this.mainText,
    required this.subText,
    required this.mainStyle,
    required this.subStyle,
  }) : super(key: key);
  final String mainText, subText;
  final TextStyle mainStyle, subStyle;

  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: mainStyle,
        children: [
          TextSpan(
            text: subText,
            style: subStyle,
          ),
        ],
      ),
    );
  }
}
