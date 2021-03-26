import 'package:fitness/constants.dart';
import 'package:flutter/cupertino.dart';

class Badge extends StatelessWidget {
  final double size;
  final Color color;
  final int value;
  Badge({this.size = 18, this.color, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size ?? 18,
      height: this.size ?? 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: this.color),
      child: WhiteText(value.toString(), size * 2 / 3, true),
    );
  }
}
