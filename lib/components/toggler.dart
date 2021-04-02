import 'package:fitness/components/color_dot.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class Toggler extends StatelessWidget {
  final bool on;
  final double width, height;
  final Function onChanged;
  Toggler({this.on, this.width = 60, this.height = 24, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        height: height + 4,
        width: width + 4,
        alignment: on ? Alignment.centerRight : Alignment.centerLeft,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2 + 2),
          border: Border.all(color: textColor.withOpacity(.7), width: 2),
        ),
        child: ColorDot(
          color: on ? primaryColor : primaryColor.withOpacity(.3),
          size: height,
        ),
      ),
    );
  }
}
