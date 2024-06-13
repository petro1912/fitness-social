import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness/screens/drawer/zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:fitness/screens/drawer/menu_page.dart';
import 'package:fitness/screens/drawer/app_menu.dart';

class DrawerScreen extends StatefulWidget {
  final Widget child;
  DrawerScreen({
    Key? key, 
    required this.child
  }) : super(key: key);
  @override
  _DrawerScreenState createState() => new _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final _drawerController = ZoomDrawerController();

  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.DefaultStyle,
      menuScreen: MenuScreen(
        mainMenu,
        callback: _updatePage,
        current: _currentPage,
      ),
      mainScreen: MainScreen(child: widget.child),
      borderRadius: 12.0,
      angle: 0.0,
      mainScreenScale: .2,
      slideWidth:
          MediaQuery.of(context).size.width * (ZoomDrawer.isRTL() ? .55 : 0.65),
      // isRtl: context.locale.languageCode == "ar",
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }

  void _updatePage(index) {
    Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    navPush(context, DrawerScreen(child: mainMenu[index].page));
    _drawerController.toggle();
  }
}

class MainScreen extends StatefulWidget {
  final Widget child;
  MainScreen({Key? key, required this.child}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final rtl = ZoomDrawer.isRTL();
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context).stateNotifier,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: false,
          child: child,
        );
      },
      child: GestureDetector(
        child: widget.child,
        onTap: () {
          if (!ZoomDrawer.of(context).isOpen()) return;
          ZoomDrawer.of(context).close();
        },
        /* onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            ZoomDrawer.of(context).toggle();
          }
        }, */
      ),
    );
  }
}

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index != currentPage) {
      _currentPage = index;
      notifyListeners();
    }
  }
}
