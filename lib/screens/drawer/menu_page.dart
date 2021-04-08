import 'dart:io';
import 'package:fitness/components/avatar.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/drawer/app_menu.dart';
import 'package:fitness/screens/drawer/drawer_screen.dart';
import 'package:fitness/screens/sidebar/profile.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> mainMenu;
  final Function(int) callback;
  final int current;

  MenuScreen(
    this.mainMenu, {
    Key key,
    this.callback,
    this.current,
  });

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final widthBox = SizedBox(
    width: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    final TextStyle androidStyle = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
    final TextStyle iosStyle = const TextStyle(color: Colors.white);
    final style = kIsWeb
        ? androidStyle
        : Platform.isAndroid
            ? androidStyle
            : iosStyle;

    return Scaffold(
      body: Container(
        color: white,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(flex: 2),
              InkWell(
                onTap: () => navPush(context, ProfileScreen()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Avatar(
                      image: 'avatar',
                      size: 40,
                    ),
                    widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlackText('Mohammed Abed', 14, true),
                        GreyText('Profile', 12)
                      ],
                    ),
                  ],
                ),
              ),
              Selector<MenuProvider, int>(
                selector: (_, provider) => provider.currentPage,
                builder: (_, index, __) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...widget.mainMenu
                        .map((item) => MenuItemWidget(
                              key: Key(item.index.toString()),
                              item: item,
                              callback: widget.callback,
                              widthBox: widthBox,
                              style: style,
                              selected: index == item.index,
                            ))
                        .toList()
                  ],
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final Widget widthBox;
  final TextStyle style;
  final Function callback;
  final bool selected;

  final white = Colors.white;

  const MenuItemWidget({
    Key key,
    this.item,
    this.widthBox,
    this.style,
    this.callback,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(item.index),
      child: Container(
        padding: mainHrPadding,
        margin: item.index == 4
            ? EdgeInsets.only(top: 100)
            : EdgeInsets.only(top: 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: getIcon(item.icon),
              color: selected ? primaryColor : greyTextColor,
              width: 24,
              height: 24,
            ),
            widthBox,
            Expanded(
              child: Text(
                item.title,
                style:
                    TextStyle(color: selected ? primaryColor : greyTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
