import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;

  CustomElevation({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: textColor.withOpacity(0.1),
          blurRadius: 46,
          offset: Offset(3, 3),
        ),
      ], color: Colors.transparent),
      child: this.child,
    );
  }
}
