import 'package:fitness/components/bottom_menu.dart';
import 'package:fitness/components/header.dart';
import 'package:flutter/material.dart';

class MainResponsiveScaffold extends StatelessWidget {
  MainResponsiveScaffold(
      {Key key, this.title, this.isMain, this.pageIndex, this.child})
      : super(key: key);
  final Widget child;
  final String title;
  final int pageIndex;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height - 80,
            ),
            child: IntrinsicHeight(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Header(
                      title: title.toUpperCase(),
                      isMain: isMain,
                    ),
                    Container(
                      child: this.child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomMenu(activeIndex: pageIndex ?? 0),
    );
  }
}
