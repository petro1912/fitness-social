import 'package:fitness/constants.dart';
import 'package:flutter/cupertino.dart';

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
          image: AssetImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
