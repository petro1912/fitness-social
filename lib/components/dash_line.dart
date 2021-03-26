import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final Color color;
  final bool vertical;
  final double size;

  const DashLine({
    this.color = Colors.black,
    this.size,
    this.vertical = true,
  });

  @override
  Widget build(BuildContext context) {
    final dashStroke = 2.0;
    final dashSize = 6.0;
    final int dashs = (size / 10).round();

    if (vertical)
      return Column(
        children: List.generate(dashs, (_) {
          return SizedBox(
            width: dashStroke,
            height: dashSize,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
      );
    else
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(dashs, (_) {
          return SizedBox(
            width: dashSize,
            height: dashStroke,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          );
        }),
      );
  }
}
