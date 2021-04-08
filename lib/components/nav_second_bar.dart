import 'package:flutter/material.dart';
import 'package:fitness/constants.dart';

class NavSecondBar extends StatelessWidget {
  NavSecondBar({this.title, this.prefixIcon, this.titleActive, this.action});
  final String title;
  final String prefixIcon;
  final bool titleActive;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.action == null ? {} : this.action(),
      child: Container(
        height: 60,
        color: secondaryColor.withOpacity(.15),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: getIcon(this.prefixIcon ?? 'user')),
            SizedBox(width: 20),
            titleActive == null || !titleActive
                ? BlackText(this.title ?? '', 14, true)
                : SecondaryText(this.title ?? '', 14, true),
            Expanded(child: SizedBox()),
            Icon(Icons.chevron_right, color: secondaryColor, size: 24)
          ],
        ),
      ),
    );
  }
}
