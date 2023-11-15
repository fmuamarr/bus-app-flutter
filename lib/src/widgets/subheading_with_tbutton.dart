import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SubTitleWithButton extends StatelessWidget {
  const SubTitleWithButton({
    Key? key,
    required this.title,
    required this.press,
    required this.buttontext,
  }) : super(key: key);

  final String title;
  final String buttontext;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          SubHeadingWithText(
            text: title,
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                press;
              },
              child: Text(buttontext))
        ],
      ),
    );
  }
}

class SubHeadingWithText extends StatelessWidget {
  const SubHeadingWithText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 5,
                color: kPrimaryColor.withOpacity(0.1),
              ))
        ],
      ),
    );
  }
}
