import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/shadow_input.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> images = [];
  String name, email, message;
  String description = '';
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'contact us',
      child: Padding(
        padding: mainHrPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            BlackText('Your Name', 16),
            SizedBox(height: 6),
            ShadowInput(
              hint: 'Mohammed Abed',
              onChanged: (text) => setState(() {
                name = text;
              }),
            ),
            SizedBox(height: 20),
            BlackText('Email or Phone', 16),
            SizedBox(height: 6),
            ShadowInput(
              hint: 'example@mail.com',
              onChanged: (text) => setState(() {
                name = text;
              }),
            ),
            SizedBox(height: 20),
            BlackText('Write Your Message', 16),
            SizedBox(height: 6),
            ShadowInput(
              hint: 'example@mail.com',
              lines: 4,
              onChanged: (text) => setState(() {
                name = text;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
