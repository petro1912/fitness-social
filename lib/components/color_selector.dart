import 'package:fitness/components/color_dot.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int _colorIndex = 0;
  List colors = [primaryColor, secondaryColor, fourthColor, thirdColor];

  Widget _buildColorDots(BuildContext context, int index) {
    Color color = colors[index];
    if (_colorIndex != index)
      return GestureDetector(
        onTap: () => setState(() {
          _colorIndex = index;
        }),
        child: ColorDot(size: 24, color: color),
      );
    else
      return DoubleColorDot(
        size: 24,
        color: color,
        child: Icon(
          Icons.check,
          color: white,
          size: 14,
        ),
      );
  }

  List<Widget> buildColors(BuildContext context) {
    return List.generate(
        colors.length, (index) => _buildColorDots(context, index));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      separatorBuilder: (context, _) => SizedBox(width: 4),
      itemBuilder: (context, index) {
        return _buildColorDots(context, index);
      },
    );
    /* return Row(
      children: buildColors(context),
    ); */
  }
}
