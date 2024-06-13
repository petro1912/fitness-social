import 'package:flutter/material.dart';

class RRCard extends StatelessWidget {
  RRCard({
    Key? key, 
    this.color = Colors.white, 
    this.padding = EdgeInsets.zero, 
    this.radius = 10, 
    required this.child
  })
      : super(key: key);
  final double radius;
  final Color color;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
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
