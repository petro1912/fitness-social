import 'package:flutter/material.dart';

const Color white = Colors.white;
const Color primaryColor = Color(0xFF31A6E2);
const Color secondaryColor = Color(0xFFF7B579);
const Color textColor = Color(0xFF22242A);
const Color greyTextColor = Color(0xFF8D92A3);
const Color grayColor = Color(0xFFF7F8FA);

//const Color primaryColor = Color(0xFF29B6F6);

Text primaryText(String text, [double size, bool bold, bool center]) {
  return getText(text, primaryColor, size, bold, center);
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

double getWindowWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getWindowHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double appPadding = 24;
