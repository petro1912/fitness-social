import 'package:fitness/constants.dart';
import 'package:fitness/model/tabbar_item.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  final List<TabbarItem> items;
  final double height;
  final bool small;

  Tabbar({Key key, this.items, this.small, this.height}) : super(key: key);
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int selectedIndex = 0;
  PageController _controller = PageController(
    initialPage: 0,
    keepPage: false,
    viewportFraction: 1,
  );

  void initState() {
    super.initState();
    _controller.addListener(
      () => setState(() {
        selectedIndex = _controller.page.toInt();
      }),
    );
  }

  void pageChanged(index) {
    setState(() {
      selectedIndex = index;
    });
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
    );
  }

  Widget _buildTabbarItemLabel(int index) {
    var selected = index == selectedIndex;
    var item = widget.items[index];
    var small = widget.small == null ? false : widget.small;
    return InkWell(
      onTap: () => pageChanged(index),
      child: Padding(
        padding: mainHrPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: selected
                  ? small
                      ? BlackText(item.label, 12, true)
                      : PrimaryText(item.label, 16, true)
                  : GreyText(item.label, small ? 12 : 16, true),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: 30,
              height: 4,
              color: selected
                  ? (small ? secondaryColor : primaryColor)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var items = widget.items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: mainHrPadding,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 44,
                margin: EdgeInsets.only(bottom: 1),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: dividerColor)),
                ),
              ),
              Container(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    items.length,
                    (index) => _buildTabbarItemLabel(index),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: widget.height,
          child: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              items.length,
              (index) => items[index].page,
            ),
          ),
        ),
      ],
    );
  }
}
