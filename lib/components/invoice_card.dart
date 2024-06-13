import 'package:fitness/components/dash_line.dart';
import 'package:fitness/components/gap_card_shape.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class InvoiceCard extends StatelessWidget {
  InvoiceCard({
    Key? key,
    required this.mainChild,
    required this.totalChild,
    this.height = 200,
    this.divPostion = .7
  })
      : super(key: key);
  final Widget mainChild, totalChild;
  final double divPostion, height;

  Widget _buildCardContent(BuildContext context) {
    return Container(
      padding: mainHrPadding,
      child: Column(
        children: [
          SizedBox(
            height: height * divPostion,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: this.mainChild,
            ),
          ),
          DashLine(
              color: Colors.black.withOpacity(.15),
              vertical: false,
              size: getWindowWidth(context) - 80),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: this.totalChild,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          offset: Offset(2, 2),
          blurRadius: 20,
        )
      ]),
      child: CustomPaint(
        painter: GapCardShape(gapPosition: divPostion),
        child: _buildCardContent(context),
      ),
    );
  }
}
