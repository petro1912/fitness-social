import 'package:fitness/constants.dart';
import 'package:flutter/cupertino.dart';

class CircleBadge extends StatelessWidget {
  final double size;
  final Color color;
  final int value;
  CircleBadge({
    this.size = 18, 
    required this.color, 
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: this.color),
      child: WhiteText(value.toString(), size * 2 / 3, true),
    );
  }
}
