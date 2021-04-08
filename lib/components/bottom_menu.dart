import 'package:fitness/constants.dart';
import 'package:fitness/screens/drawer/drawer_screen.dart';
import 'package:fitness/screens/community/community.dart';
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
  NavbarItem(
    icon: 'store',
    label: 'Store',
    screen: DrawerScreen(child: StoreScreen()),
  ),
  NavbarItem(
    icon: 'workout',
    label: 'Workout',
    screen: DrawerScreen(child: WorkoutScreen()),
  ),
  NavbarItem(
    icon: 'community',
    label: 'Community',
    screen: DrawerScreen(child: CommunityScreen()),
  ),
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
      backgroundColor: Colors.white,
      items: navbarItems
          .map((item) => BottomNavigationBarItem(
                icon: ImageIcon(getIcon(item.icon)),
                label: item.label,
              ))
          .toList(),
      currentIndex: pageIndex == null ? 0 : pageIndex,
      selectedItemColor: primaryColor,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
