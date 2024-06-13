import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/toggler.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool allowEncourageMsg;
  late bool allowLocation;
  late bool allowNotification;
  late bool allowCamera;

  void initState() {
    setState(() {
      allowEncourageMsg = true;
      allowLocation = true;
      allowNotification = false;
      allowCamera = false;
    });
    super.initState();
  }

  void encourageSetting() {
    setState(() {
      allowEncourageMsg = !allowEncourageMsg;
    });
  }

  void locationSetting() {
    setState(() {
      allowLocation = !allowLocation;
    });
  }

  void notificationSetting() {
    setState(() {
      allowNotification = !allowNotification;
    });
  }

  void cameraSetting() {
    setState(() {
      allowCamera = !allowCamera;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'settings',
      child: Column(
        children: [
          Padding(
            padding: mainHrPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlackText('Allow encouragement messages', 15),
                    Toggler(
                      on: allowEncourageMsg,
                      onChanged: encourageSetting,
                    )
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlackText('Allow location', 15),
                    Toggler(
                      on: allowLocation,
                      onChanged: locationSetting,
                    )
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlackText('Allow notification', 15),
                    Toggler(
                      on: allowNotification,
                      onChanged: notificationSetting,
                    )
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlackText('Allow access to camera', 15),
                    Toggler(
                      on: allowCamera,
                      onChanged: cameraSetting,
                    )
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
              ],
            ),
          ),
          // Spacer(),
          // PrimaryBlockButton(label: 'Submit', action: () => {}),
          // SizedBox(height: 40),
        ],
      ),
    );
  }
}
