import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class CountSelector extends StatefulWidget {
  CountSelector({Key key, this.onChanged}) : super(key: key);
  final Function onChanged;
  _CountSelectorState createState() => _CountSelectorState();
}

class _CountSelectorState extends State<CountSelector> {
  int _count = 1;

  void updateCount(bool down) {
    int cnt = down ? _count - 1 : _count + 1;
    setState(() {
      _count = cnt;
    });
    if (widget.onChanged != null) widget.onChanged(cnt);
  }

  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 28,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: textColor.withOpacity(.1),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => updateCount(true),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: blackText('-', 16),
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right:
                      BorderSide(color: textColor.withOpacity(.2), width: .8),
                  left: BorderSide(color: textColor.withOpacity(.2), width: .8),
                ),
              ),
              child: blackText(_count.toString(), 14, false, true),
            ),
          ),
          SizedBox(width: 6),
          GestureDetector(
            onTap: () => updateCount(false),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: blackText('+', 16),
            ),
          ),
        ],
      ),
    );
  }
}
