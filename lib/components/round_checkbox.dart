import 'package:fitness/constants.dart';

import 'package:flutter/material.dart';

class RoundCheckbox extends StatefulWidget {
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: textColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: _value
              ? Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.black,
                )
              : Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
