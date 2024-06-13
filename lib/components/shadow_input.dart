import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class ShadowInput extends StatelessWidget {
  final Function onChanged;
  final String hint;
  final int lines;
  ShadowInput({
    Key? key, 
    required this.onChanged, 
    required this.hint, 
    this.lines = 1
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(5, 5),
            blurRadius: 10,
          )
        ],
        color: white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        initialValue: '',
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hint ?? '',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (str) => onChanged(str),
        style: TextStyle(color: textColor),
        minLines: lines,
        maxLines: lines,
      ),
    );
  }
}
