import 'package:flutter/material.dart';
import 'package:fitness/components/elevation.dart';
import 'package:fitness/constants.dart';

class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton(
      {Key key,
      this.filled,
      this.action,
      this.label,
      this.color,
      this.textColor})
      : super(key: key);
  final bool filled;
  final Function action;
  final String label;
  final Color color, textColor;

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
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: _filled ? textColor ?? white : primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: appPadding * 1.6, vertical: appPadding * 2 / 3),
      ),
    );
  }
}
