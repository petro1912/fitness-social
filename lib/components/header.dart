import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key, this.title, this.isMain}) : super(key: key);
  final String title;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            width: double.infinity,
            child: blackText(title.toUpperCase(), 16, true, true),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              (isMain != null && isMain)
                  ? 'assets/icons/tab-icon.png'
                  : 'assets/icons/arrow-left.png',
              scale: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
