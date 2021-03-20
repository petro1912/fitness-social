import 'package:fitness/components/header.dart';
import 'package:fitness/components/responsive_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:fitness/screens/verification.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String phoneNumber = '';

  void proceed() {
    print('clicked');
    if (phoneNumber.isNotEmpty) navPush(context, VerificationScreen());
  }

  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Header(title: 'create an account'),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/photo-select.png'),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        prefixIcon: Icon(
                          Icons.account_circle_rounded,
                          color: textColor.withOpacity(0.5),
                        ),
                      ),
                      onChanged: (text) => setState(() {
                        phoneNumber = text;
                      }),
                      style: TextStyle(color: textColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.account_circle_rounded,
                          color: textColor.withOpacity(0.5),
                        ),
                      ),
                      onChanged: (text) => setState(() {
                        phoneNumber = text;
                      }),
                      style: TextStyle(color: textColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'E-Mail',
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: textColor.withOpacity(0.5),
                        ),
                        suffix: secondaryText('optional'),
                      ),
                      onChanged: (text) => setState(() {
                        phoneNumber = text;
                      }),
                      style: TextStyle(color: textColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: textColor.withOpacity(0.5),
                        ),
                      ),
                      onChanged: (text) => setState(() {
                        phoneNumber = text;
                      }),
                      style: TextStyle(color: textColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/male.png'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            primaryText('MALE', 14, true, true),
                          ],
                        ),
                        Container(
                          height: 46,
                          width: 80,
                          child: VerticalDivider(color: textColor),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            primaryText('FEMALE', 14, true, true),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: textColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: RoundedRaisedButton(
                    label: 'Proceed',
                    filled: true,
                    action: () => proceed(),
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
