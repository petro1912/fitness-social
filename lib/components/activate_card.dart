import 'package:fitness/components/color_dot.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class ActivateCard extends StatefulWidget {
  final String title, description, date, img;
  final bool isFavorite;
  final Function action;
  ActivateCard({
    Key key,
    this.title,
    this.description,
    this.img,
    this.date,
    this.isFavorite,
    this.action,
  }) : super(key: key);
  _ActivateCardState createState() => _ActivateCardState();
}

class _ActivateCardState extends State<ActivateCard> {
  Widget build(BuildContext context) {
    // GoalAction action = goalActionList[index];
    return InkWell(
      onTap: () => widget.action == null ? {} : widget.action(),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: textColor.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 12,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: getAssetImage(widget.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6, left: 6),
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: white.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: WhiteText(widget.date, 10, true),
                )
              ],
            ),
            // SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 10),
                      Container(
                        width: 20,
                        margin: EdgeInsets.only(bottom: 4),
                        child: ColorDot(
                            color: widget.isFavorite
                                ? primaryColor
                                : secondaryColor,
                            size: 6),
                      ),
                      Expanded(
                        child: BlackText(widget.title, 16, true),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: GreyText(widget.description, 10),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
