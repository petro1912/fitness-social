import 'package:fitness/screens/sidebar/about_us.dart';
import 'package:fitness/screens/sidebar/contact.dart';
import 'package:fitness/screens/sidebar/diary.dart';
import 'package:fitness/screens/sidebar/feedback.dart';
import 'package:fitness/screens/sidebar/membership.dart';
import 'package:fitness/screens/sidebar/settings.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String icon;
  final int index;
  final Widget page;

  const MenuItem({
    required this.title, 
    required this.icon, 
    required this.index, 
    required this.page
  });
}

List<MenuItem> mainMenu = [
  MenuItem(
    title: "View Membership",
    icon: 'membership',
    index: 0,
    page: MembershipScreen(),
  ),
  MenuItem(
    title: "Switch Plans",
    icon: 'plan',
    index: 1,
    page: MembershipScreen(),
  ),
  MenuItem(
    title: "Personal Diary",
    icon: 'diary',
    index: 2,
    page: DiaryScreen(),
  ),
  // MenuItem(
  //   title: "Favorite",
  //   icon: 'favorite',
  //   index: 3,
  //   page: ProfileScreen(),
  // ),
  // MenuItem(title: null),
  MenuItem(
    title: "About us",
    icon: 'about',
    index: 3,
    page: AboutScreen(),
  ),
  MenuItem(
    title: "Contact us",
    icon: 'contact',
    index: 4,
    page: ContactScreen(),
  ),
  MenuItem(
    title: "Feedback",
    icon: 'feedback',
    index: 5,
    page: FeedbackScreen(),
  ),
  MenuItem(
    title: "Settings",
    icon: 'setting',
    index: 6,
    page: SettingsScreen(),
  ),
];
