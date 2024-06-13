import 'package:fitness/components/badge.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({
    Key? key, 
    this.image, 
    required this.size, 
    this.active = false
  }) : super(key: key);
  final String? image;
  final double size;
  final bool? active;

  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: textColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: getAssetImage(image!),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        border: Border.all(
          color: active! ? primaryColor : Colors.transparent,
          width: active! ? 0 : 3,
        ),
      ),
    );
  }
}

class TextAvatar extends StatelessWidget {
  TextAvatar({
    Key? key, 
    this.color, 
    required this.name, 
    required this.size, 
    this.active = false,
    })
      : super(key: key);
  final String name;
  final double size;
  final Color? color;
  final bool active;

  Widget build(BuildContext context) {
    var avImg = this.name.length == 1 ? this.name : getAvatarName(this.name);
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Colors.amber,
        shape: BoxShape.circle,
        border: Border.all(
          color: active ? primaryColor : Colors.transparent,
          width: active ? 0 : 3,
        ),
      ),
      child: WhiteText(avImg, 24, true),
    );
  }
}

class ChatAvatar extends StatelessWidget {
  ChatAvatar({
    Key? key, 
    this.size = 60, 
    this.image, 
    required this.name, 
    required this.count, 
    required this.active
  })
      : super(key: key);
  final String? image;
  final String name;
  final double size;
  final int count;
  final bool active;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            this.image != null
                ? Avatar(size: size, image: image, active: active)
                : TextAvatar(
                    color: primaryColor,
                    size: 60,
                    name: name,
                    active: active,
                  ),
            count > 0
                ? CircleBadge(
                    color: count > 10 ? pinkColor : secondaryColor,
                    size: 20,
                    value: count,
                  )
                : SizedBox()
          ],
        ),
        SizedBox(height: 4),
        Container(
          alignment: Alignment.topCenter,
          width: 80,
          child: Text(
            name,
            style: TextStyle(fontSize: 11),
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
