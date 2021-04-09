import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitness/screens/drawer/zoom_drawer.dart';

class Header extends StatelessWidget {
  const Header({Key key, this.title, this.isMain, this.actionIcon, this.action})
      : super(key: key);
  final String title;
  final bool isMain;
  final Widget actionIcon;
  final Function action;

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
              if (isMain != null && isMain) {
                ZoomDrawer.of(context).toggle();
              } else
                Navigator.pop(context);
            },
            child: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: Image(
                  image: getIcon(icon),
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: actionIcon != null
                ? InkWell(
                    onTap: () => action != null ? action() : {},
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: actionIcon,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
