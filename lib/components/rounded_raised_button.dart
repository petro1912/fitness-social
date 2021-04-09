import 'package:flutter/material.dart';
import 'package:fitness/components/elevation.dart';
import 'package:fitness/constants.dart';

class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton({
    Key key,
    this.filled,
    this.action,
    this.label,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);
  final bool filled;
  final Function action;
  final String label;
  final Color color, textColor;
  final Widget icon;

  Widget build(BuildContext context) {
    bool _filled = filled == null || filled;
    return CustomElevation(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          // side: BorderSide(color: primaryColor, width: 3.0),
        ),
        onPressed: () => action != null ? action() : {},
        color: (color != null)
            ? color
            : _filled
                ? primaryColor
                : white,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: this.icon ?? SizedBox(),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: _filled ? textColor ?? white : primaryColor,
                fontWeight: Bold,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: appPadding * 0.6,
          vertical: appPadding * 2 / 3,
        ),
      ),
    );
  }
}
