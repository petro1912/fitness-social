import 'package:fitness/constants.dart';
import 'package:fitness/screens/store/store.dart';
import 'package:fitness/screens/workout/workout.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class NavbarItem {
  NavbarItem({this.icon, this.label, this.screen});
  final String icon;
  final String label;
  final Widget screen;
}

List navbarItems = [
  NavbarItem(icon: 'store.png', label: 'Store', screen: StoreScreen()),
  NavbarItem(icon: 'workout.png', label: 'Workout', screen: WorkoutScreen()),
  NavbarItem(icon: 'community.png', label: 'Community', screen: StoreScreen()),
];

class BottomMenu extends StatefulWidget {
  BottomMenu({Key key, this.activeIndex}) : super(key: key);
  final int activeIndex;
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int pageIndex = 0;
  void initState() {
    super.initState();
    setState(() {
      pageIndex = widget.activeIndex;
    });
  }

  void _onItemTapped(BuildContext context, int index) {
    navPush(context, navbarItems[index].screen);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: navbarItems
          .map((item) => BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/${item.icon}')),
                label: item.label,
              ))
          .toList(),
      /* [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/store.png')),
          label: 'Store',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/workout.png')),
          label: 'Workout',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/user-group.png')),
          label: 'Community',
        ),
      ], */
      currentIndex: pageIndex == null ? 0 : pageIndex,
      selectedItemColor: primaryColor,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
