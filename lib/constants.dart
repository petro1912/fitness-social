import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
const Color greyBtnColor = Color(0xFFF1F3F8);
const Color greyIconColor = Color(0xFFCDCDD7);
const Color grayColor = Color(0xFFF7F8FA);
const Color dividerColor = Color(0x1F000000);
const Color successColor = Color(0xFF51DC8E);
const Color errorColor = Color(0xFFEF4B5F);
const Color pinkColor = Color(0xFF6487D3);

//const Color primaryColor = Color(0xFF29B6F6);
MaskTextInputFormatter cardFormat = MaskTextInputFormatter(
  mask: '#### #### #### ####',
  filter: {"#": RegExp(r'[0-9]')},
);
MaskTextInputFormatter expiredFormat = MaskTextInputFormatter(
  mask: '##/##',
  filter: {"#": RegExp(r'[0-9]')},
);
MaskTextInputFormatter cvvFormat = MaskTextInputFormatter(
  mask: '###',
  filter: {"#": RegExp(r'[0-9]')},
);

Text PrimaryText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, primaryColor, size, bold, center);
}

Text lightPrimaryText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, primaryColor.withOpacity(.6), size, bold, center);
}

Text SecondaryText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, secondaryColor, size, bold, center);
}

Text BlackText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, textColor, size, bold, center);
}

Text GreyText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, greyTextColor, size, bold, center);
}

Text WhiteText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, white, size, bold, center);
}

Text ErrorText(String text, [double? size, bool bold = false, bool center = false]) {
  return getText(text, errorColor, size, bold, center);
}

Text getText(String text, Color color, [double? size, bool bold = false, bool center = false]) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: (bold) ? Bold : FontWeight.normal,
      fontSize: (size != null) ? size : 14,
      color: color,
      height: 1.3,
    ),
    textAlign: center ? TextAlign.center : TextAlign.start,
  );
}

Widget PrimaryBlockButton({required VoidCallback? action, required String label, Widget? icon}) {
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
        icon: icon,
      ),
    ),
  );
}

Widget SecondaryBlockButton({VoidCallback? action, required String label, Widget? icon}) {
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
        icon: icon,
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

String getAvatarName(name) {
  List<String> names = name.split(" ");
  String initials = "";

  for (var i = 0; i < names.length; i++) {
    if (names[i][0] == names[i][0].toUpperCase()) initials += '${names[i][0]}';
  }
  if (initials.length < 2) return initials;
  return initials.substring(0, 2);
}

AssetImage getIcon(String image) {
  return AssetImage('assets/icons/$image.png');
}

AssetImage getAssetImage(String image) {
  return AssetImage('assets/images/$image.png');
}

void showAppBtSheet(BuildContext context, Widget sheet) {
  showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (context) => sheet,
  );
}

void showMessage(BuildContext context, Dialog dialog) {
  showDialog(context: context, builder: (context) => dialog);
}

EdgeInsets mainHrPadding = EdgeInsets.symmetric(horizontal: 30);
const FontWeight Bold = FontWeight.bold;
double appPadding = 24;
