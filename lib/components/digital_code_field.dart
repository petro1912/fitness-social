import 'package:flutter/material.dart';
import 'package:fitness/constants.dart';

class DigitalCodeField extends StatefulWidget {
  DigitalCodeField({
    Key key,
    this.digits = 4,
    this.unit = 1,
    this.width,
    this.textSize = 32,
    this.textColor = primaryColor,
    this.whiteBorder,
    this.chagedDigits,
  }) : super(key: key);
  final int digits, unit;
  final double width;
  final double textSize;
  final Color textColor;
  final bool whiteBorder;
  final Function chagedDigits;

  _DigitalCodeFieldState createState() => _DigitalCodeFieldState();
}

class _DigitalCodeFieldState extends State<DigitalCodeField> {
  List<FocusNode> _focusNodes = [];
  List<String> code;

  List<Widget> _buildDCWidget() {
    List<Widget> dcWidget = [];
    var whited = widget.whiteBorder != null && widget.whiteBorder;
    const whiteBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: white));
    const blackBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: textColor));
    const primaryBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: primaryColor));
    var border = whited ? whiteBorder : blackBorder;

    for (var idx = 0; idx < widget.digits; idx++) {
      dcWidget.add(
        Container(
          width: widget.width / widget.digits - appPadding / 2,
          margin: EdgeInsets.symmetric(
            horizontal: appPadding / 4,
          ),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            focusNode: _focusNodes[idx],
            onChanged: (String c) => digitChanged(idx, c),
            maxLength: widget.unit,
            decoration: InputDecoration(
              hintText: '',
              counterText: '',
              isDense: true,
              border: border,
              enabledBorder: border,
              focusedBorder: whited ? whiteBorder : primaryBorder,
            ),
            style: TextStyle(
              fontWeight: Bold,
              color: widget.textColor,
              fontSize: widget.textSize,
            ),
          ),
        ),
      );
    }
    return dcWidget;
  }

  @override
  void initState() {
    super.initState();
    for (var idx = 0; idx < widget.digits; idx++) {
      _focusNodes.add(FocusNode());
    }
    setState(() {
      code = List.generate(widget.digits, (index) => '');
    });
  }

  @override
  void dispose() {
    _focusNodes.forEach((el) => el.dispose());
    super.dispose();
  }

  void digitChanged(int idx, String cd) {
    setState(() {
      code[idx] = cd;
      if (widget.chagedDigits != null) widget.chagedDigits(code);
    });
    if (cd.length == widget.unit && idx != 3)
      FocusScope.of(context).nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDCWidget(),
    );
  }
}
