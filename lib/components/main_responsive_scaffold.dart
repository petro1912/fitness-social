import 'package:fitness/components/bottom_menu.dart';
import 'package:fitness/components/header.dart';
import 'package:flutter/material.dart';

class MainResponsiveScaffold extends StatelessWidget {
  MainResponsiveScaffold({
    Key? key,
    required this.title,
    this.isMain = false,
    this.pageIndex = 0,
    required this.child,
    this.headerAction,
    this.headerActionIcon,
  }) : super(key: key);
  final Widget child;
  final String title;
  final int pageIndex;
  final bool isMain;
  final Widget? headerActionIcon;
  final GestureTapCallback? headerAction;

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Header(
                      title: title.toUpperCase(),
                      isMain: isMain,
                      actionIcon: headerActionIcon,
                      action: headerAction,
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
      bottomNavigationBar: BottomMenu(activeIndex: pageIndex),
    );
  }
}
