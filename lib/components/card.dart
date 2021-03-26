import 'package:flutter/material.dart';

class RRCard extends StatelessWidget {
  RRCard({Key key, this.color, this.padding, this.radius, this.child})
      : super(key: key);
  final double radius;
  final Color color;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 10,
          )
        ],
      ),
      child: this.child,
    );
  }
}
