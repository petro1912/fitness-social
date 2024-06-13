import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/color_dot.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DialogBox {
  static Dialog success(BuildContext context) {
    return create(
      child: Column(
        children: [
          SizedBox(height: 30),
          ColorDot(
            color: successColor,
            size: 96,
            child: Icon(
              Icons.check,
              color: white,
              size: 30,
            ),
          ),
          SizedBox(height: 20),
          BlackText('Success', 14, true, true),
          SizedBox(height: 10),
          GreyText('Enhance Wellness By Doing Something\n Different With Nlp',
              12, false, true),
          SizedBox(height: 30),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: TextButton(
              child: PrimaryText('CONTINUE SHOPPING', 11, true),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  static Dialog noConnection(BuildContext context) {
    return create(
      child: Column(
        children: [
          SizedBox(height: 30),
          ColorDot(
            color: errorColor,
            size: 96,
            child: Icon(
              Icons.wifi,
              color: white,
              size: 30,
            ),
          ),
          SizedBox(height: 20),
          BlackText('No connection', 14, true, true),
          SizedBox(height: 10),
          GreyText('Dream Interpretation Common \nSymbols And Their Meanings',
              12, false, true),
          SizedBox(height: 30),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: TextButton(
              child: ErrorText('TRY AGAIN', 11, true),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  static Dialog paymentSuccess(BuildContext context) {
    return create(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Image(
                  image: getIcon('firework'),
                ),
              ),
              ColorDot(
                color: secondaryColor,
                size: 96,
                child: Icon(
                  Icons.check,
                  color: white,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          BlackText('Payment Completed', 14, true, true),
          SizedBox(height: 10),
          GreyText('Your Payment successfully completed!', 12, false, true),
          SizedBox(height: 30),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: TextButton(
              child: PrimaryText('CONTINUE', 11, true),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  static Dialog rateApp(BuildContext context) {
    return create(
      child: Column(
        children: [
          SizedBox(height: 50),
          BlackText('Rate our App', 14, true, true),
          SizedBox(height: 10),
          GreyText(
              'If you love our app, please take a monet to rate\n it in the store',
              12,
              false,
              true),
          SizedBox(height: 10),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: secondaryColor,
            ),
            itemSize: 30,
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: TextButton(
                        child: GreyText('CLOSE', 11, true),
                        onPressed: () => {},
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        child: PrimaryText('RATE', 11, true),
                        onPressed: () => {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  static Dialog updateWorkout(BuildContext context) {
    return create(
      child: Column(
        children: [
          Stack(
            // alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Image(
                  image: getAssetImage('upgrade-bg'),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: ColorDot(
                    color: white,
                    size: 30,
                    child: Icon(
                      Icons.close,
                      color: greyTextColor,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          BlackText('Update 10.9', 14, true, true),
          SizedBox(height: 10),
          GreyText('Three Ways To Get Workout Discounts!', 12, false, true),
          SizedBox(height: 30),
          Divider(),
          SizedBox(height: 20),
          SecondaryBlockButton(label: 'Get Update'),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  static Dialog favoriteUser(BuildContext context, MemberChat user) {
    return create(
      child: Column(
        children: [
          SizedBox(height: 30),
          user.img == null
              ? TextAvatar(name: user.name, size: 72)
              : Avatar(image: user.img, size: 72),
          BlackText(user.name, 24, true, true),
          SizedBox(height: 10),
          GreyText('Business', 12, false, true),
          SizedBox(height: 30),
          SecondaryBlockButton(
            label: 'Favorite',
            action: () => {},
            icon: Icon(Icons.star, size: 24, color: white),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  static Dialog confirm(BuildContext context,
    {
      required String title,
      required String yes,
      required String no,
      VoidCallback? yesAction,
      VoidCallback? noAction
    }) {
    return create(
      child: Column(
        children: [
          SizedBox(height: 30),
          BlackText(title, 14, true, true),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: RoundedRaisedButton(
                    label: no,
                    filled: true,
                    action: noAction,
                    color: greyBtnColor,
                    textColor: greyTextColor,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: RoundedRaisedButton(
                    label: yes,
                    filled: true,
                    action: yesAction,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Dialog create({required Widget child}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      backgroundColor: Colors.white, //Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
        ],
      ),
    );
  }
}
