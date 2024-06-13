import 'package:flutter/material.dart';
import 'package:fitness/components/elevation.dart';
import 'package:fitness/constants.dart';

class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton({
    Key? key,
    required this.filled,
    required this.label,
    this.action,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);
  final bool filled;
  final VoidCallback? action;
  final String label;
  final Color? color, textColor;
  final Widget? icon;

  Widget build(BuildContext context) {
    bool _filled = filled;

    return CustomElevation(
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
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
      ),
    );
  }
}
