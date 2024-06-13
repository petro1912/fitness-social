import 'package:flutter/material.dart';

class DashboardItem {
  final String name;
  final String icon;
  final String value;
  final String unit;
  final Widget screen;

  DashboardItem({
    required this.name, 
    required this.icon, 
    required this.value, 
    required this.unit, 
    required this.screen
  });
}
