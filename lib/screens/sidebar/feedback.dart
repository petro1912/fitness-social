import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/shadow_input.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  late String message;
  late int faceIdx;
  void initState() {
    super.initState();
  }

  Widget buildFaceImage(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        faceIdx = index;
      }),
      child: Container(
        padding: EdgeInsets.all(2),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: faceIdx == index ? primaryColor : Colors.transparent,
              width: 2),
        ),
        child: Image(
          image: getIcon('face-${index + 1}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'feed back',
      child: Container(
        height: getWindowHeight(context) - 160,
        child: Column(
          children: [
            Padding(
              padding: mainHrPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: BlackText(
                        'Your opinion is important to us'.toUpperCase(),
                        14,
                        true),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Select which best represent your \nexperience on our app',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        List.generate(5, (index) => buildFaceImage(index)),
                  ),
                  SizedBox(height: 100),
                  BlackText('Your Experience', 20),
                  SizedBox(height: 20),
                  ShadowInput(
                    hint:
                        'Write your experience or tell us how we can serve you better',
                    lines: 2,
                    onChanged: (text) => setState(() {
                      message = text;
                    }),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(height: 20),
            PrimaryBlockButton(
              label: 'Submit',
              action: () => {}
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
