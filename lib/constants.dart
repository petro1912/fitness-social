import 'package:flutter/material.dart';
import 'components/rounded_raised_button.dart';

const Color white = Colors.white;
const Color primaryColor = Color(0xFF31A6E2);
const Color lightPrimaryColor = Color(0xDD31A6E2);
const Color lighterPrimaryColor = Color(0x3331A6E2);
const Color secondaryColor = Color(0xFFF7B579);
const Color thirdColor = Color(0xFF18CBAF);
const Color fourthColor = Color(0xFFC585E9);
const Color textColor = Color(0xFF22242A);
const Color lightTextColor = Color(0xAA22242A);
const Color greyTextColor = Color(0xFF8D92A3);
const Color grayColor = Color(0xFFF7F8FA);

//const Color primaryColor = Color(0xFF29B6F6);

Text primaryText(String text, [double size, bool bold, bool center]) {
  return getText(text, primaryColor, size, bold, center);
}

Text lightPrimaryText(String text, [double size, bool bold, bool center]) {
  return getText(text, primaryColor.withOpacity(.6), size, bold, center);
}

Text secondaryText(String text, [double size, bool bold, bool center]) {
  return getText(text, secondaryColor, size, bold, center);
}

Text blackText(String text, [double size, bool bold, bool center]) {
  return getText(text, textColor, size, bold, center);
}

Text greyText(String text, [double size, bool bold, bool center]) {
  return getText(text, greyTextColor, size, bold, center);
}

Text whiteText(String text, [double size, bool bold, bool center]) {
  return getText(text, white, size, bold, center);
}

Text getText(String text, Color color, [double size, bool bold, bool center]) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: (bold != null && bold) ? FontWeight.bold : FontWeight.normal,
      fontSize: (size != null) ? size : 14,
      color: color,
    ),
    textAlign: center != null && center ? TextAlign.center : TextAlign.start,
  );
}

Widget PrimaryBlockButton({Function action, String label}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 30,
    ),
    child: SizedBox(
      width: double.infinity,
      child: RoundedRaisedButton(
        label: label,
        filled: true,
        action: action,
        color: primaryColor,
      ),
    ),
  );
}

Widget SecondaryBlockButton({Function action, String label}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 30,
    ),
    child: SizedBox(
      width: double.infinity,
      child: RoundedRaisedButton(
        label: label,
        filled: true,
        action: action,
        color: secondaryColor,
      ),
    ),
  );
}

double getWindowWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getWindowHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String getSubstring(String text, int length) {
  if (text.length <= length) {
    return text;
  }
  return '${text.substring(0, length - 3)} ...';
}

double appPadding = 24;
