import 'package:fitness/components/header.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/screens/verification.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = '';

  void verify() {
    print('clicked');
    if (phoneNumber.isNotEmpty) navPush(context, VerificationScreen());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Header(title: 'login'),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: blackText(strPhonNumberPlaceholder, 20, true, true),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  initialValue: '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: textColor.withOpacity(0.5),
                    ),
                  ),
                  onChanged: (text) => setState(() {
                    phoneNumber = text;
                  }),
                  style: TextStyle(color: textColor),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: RoundedRaisedButton(
                    label: 'Proceed',
                    filled: true,
                    action: () => verify(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
