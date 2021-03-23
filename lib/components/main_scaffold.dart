import 'package:fitness/components/bottom_menu.dart';
import 'package:fitness/components/header.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({Key key, this.title, this.isMain, this.pageIndex, this.child})
      : super(key: key);
  final Widget child;
  final String title;
  final int pageIndex;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Header(
                title: title.toUpperCase(),
                isMain: isMain,
              ),
              Container(
                height: getWindowHeight(context) - 152,
                child: this.child,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomMenu(activeIndex: pageIndex ?? 0),
    );
  }
}
