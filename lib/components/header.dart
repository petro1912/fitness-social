import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key, this.title, this.isMain}) : super(key: key);
  final String title;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    var icon = (isMain != null && isMain) ? 'tab-icon' : 'arrow-left';
    return Container(
      height: 72,
      margin: mainHrPadding,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            width: double.infinity,
            child: BlackText(title.toUpperCase(), 16, true, true),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: getIcon(icon)),
          ),
        ],
      ),
    );
  }
}
