import 'package:fitness/constants.dart';
import 'package:flutter/cupertino.dart';

class ClubCard extends StatefulWidget {
  final String? img;
  final String title, subtitle;
  final GestureTapCallback? action;
  ClubCard({
    Key? key, 
    this.img, 
    required this.title, 
    required this.subtitle, 
    required this.action
  })
      : super(key: key);

  _ClubCardState createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: textColor.withOpacity(.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Image(
                  image: getAssetImage(widget.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: BlackText(widget.title, 14, true),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SecondaryText(widget.subtitle, 11),
            ),
          ],
        ),
      ),
    );
  }
}
