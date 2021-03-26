import 'package:fitness/components/color_dot.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/require_item.dart';
import 'package:flutter/material.dart';

class RequirementsBlock extends StatelessWidget {
  final List<RequireItem> items;
  RequirementsBlock({this.items});

  Widget _buildItem(index) {
    var item = items[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: dividerColor, width: .5))),
      child: Row(
        children: [
          ColorDot(
            color: item.require ? secondaryColor : primaryColor,
            size: 6,
          ),
          SizedBox(width: 20),
          BlackText(item.field, 14, true),
          Expanded(child: SizedBox()),
          item.require
              ? SecondaryText('Require', 10)
              : PrimaryText('Optional', 10)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: BlackText('Requirements', 11, true),
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(items.length, (index) => _buildItem(index)),
        ),
      ],
    );
  }
}
