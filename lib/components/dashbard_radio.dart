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
  final Color color;
  GroupItem({this.name, this.index, this.color});
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
                      scale: 1.2,
                      child: Radio(
                        // title: BlackText("${list[index].name}", 14, true),
                        activeColor: primaryColor,
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
                  SizedBox(width: 20),
                  BlackText("${list[index].name}", 14, true),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 20,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: list[index].color,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 60),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
