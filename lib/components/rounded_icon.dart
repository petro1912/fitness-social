import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  RoundedIcon({Key key, this.image, this.size, this.color, this.borderSize})
      : super(key: key);
  final String image;
  final Color color;
  final double size, borderSize;

  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFFF),
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(.3), width: borderSize),
        /* image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ), */
      ),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
