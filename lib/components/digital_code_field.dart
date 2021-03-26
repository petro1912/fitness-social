import 'package:flutter/material.dart';
import 'package:fitness/constants.dart';

class DigitalCodeField extends StatefulWidget {
  DigitalCodeField({Key key, this.digits, this.chagedDigits}) : super(key: key);
  final int digits;
  final Function chagedDigits;

  _DigitalCodeFieldState createState() => _DigitalCodeFieldState();
}

class _DigitalCodeFieldState extends State<DigitalCodeField> {
  int focused = 0;
  List<FocusNode> _focusNodes = []; //List.generate(4, (index) => FocusNode());
  List<String> code;

  List<Widget> _buildDCWidget() {
    List<Widget> dcWidget = [];
    for (var idx = 0; idx < widget.digits; idx++) {
      dcWidget.add(
        Container(
          width: (getWindowWidth(context) - 80) / 4 - appPadding / 2,
          margin: EdgeInsets.symmetric(
            horizontal: appPadding / 4,
          ),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            focusNode: _focusNodes[idx],
            onChanged: (String c) => digitChanged(idx, c),
            maxLength: 1,
            decoration: InputDecoration(
              hintText: '',
              counterText: '',
            ),
            style:
                TextStyle(fontWeight: Bold, color: primaryColor, fontSize: 32),
          ),
        ),
      );
    }
    return dcWidget;
  }

  @override
  void initState() {
    for (var idx = 0; idx < widget.digits; idx++) {
      _focusNodes.add(FocusNode());
      _focusNodes[idx].addListener(() {
        if (_focusNodes[idx].hasFocus) {
          setState(() {
            focused = idx;
          });
        }
      });
    }
    setState(() {
      code = List.generate(widget.digits, (index) => null);
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNodes.forEach((el) => el.dispose());
    super.dispose();
  }

  void digitChanged(int idx, String cd) {
    setState(() {
      code[idx] = cd;
      widget.chagedDigits(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDCWidget(),
    );
  }
}
