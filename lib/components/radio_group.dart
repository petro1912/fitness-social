import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  RadioGroup({Key key, this.groupItems}) : super(key: key);
  final List<GroupItem> groupItems;
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class GroupItem {
  final String name;
  final int index;
  final String icon;
  GroupItem({this.name, this.index, this.icon});
}

class RadioGroupWidget extends State<RadioGroup> {
  int id = 0;

  Widget build(BuildContext context) {
    List list = widget.groupItems;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        list.length,
        (index) => InkWell(
          onTap: () => setState(() {
            id = index;
          }),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Transform.scale(
                      scale: 1.1,
                      child: Radio(
                        // title: blackText("${list[index].name}", 14, true),
                        activeColor: secondaryColor,
                        groupValue: id,
                        value: index,
                        onChanged: (val) {
                          setState(() {
                            id = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  blackText("${list[index].name}", 14, true),
                  SizedBox(width: 20),
                  Image(
                      image: AssetImage('assets/icons/${list[index].icon}.png'))
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
