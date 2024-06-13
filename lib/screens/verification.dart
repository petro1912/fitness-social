import 'package:fitness/components/digital_code_field.dart';
import 'package:fitness/components/header.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/screens/account.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late String phoneNumber;
  late List<String> digits;

  void runVerify() async {
    if (digits.where((dg) => dg == null).toList().length > 0) {
      return print('please input all code');
    }
  }

  void changedDigits(List<String> dts) {
    setState(() {
      print(dts);
      digits = dts;
    });
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
                child: BlackText(strPhonNumberPlaceholder, 20, true, true),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: mainHrPadding,
                child: DigitalCodeField(
                  digits: 4,
                  width: getWindowWidth(context) - 80,
                  chagedDigits: changedDigits,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: mainHrPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: RoundedRaisedButton(
                    label: 'Verify',
                    filled: true,
                    action: () => navPush(context, AccountScreen()),
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
