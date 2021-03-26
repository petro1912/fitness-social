import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({Key key, this.image, this.size}) : super(key: key);
  final String image;
  final double size;

  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: textColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: getAssetImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class TextAvatar extends StatelessWidget {
  TextAvatar({Key key, this.color, this.name, this.size}) : super(key: key);
  final String name;
  final double size;
  final Color color;

  Widget build(BuildContext context) {
    var avImg = this.name.length == 1 ? this.name : getAvatarName(this.name);
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Colors.amber,
        shape: BoxShape.circle,
      ),
      child: WhiteText(avImg, 24, true),
    );
  }
}
