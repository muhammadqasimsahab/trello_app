import 'package:flutter/material.dart';

import '../utils/appcolors.dart';

class ReusableButton extends StatelessWidget {
  String title;
  Function() onpress;
  double height;
  double width;
  // var font;
  var buttonColor;
  double fsize;
  var fontcolor;

  ReusableButton(
      {super.key,
      required this.title,
      required this.onpress,
      required this.height,
      required this.width,
      // required this.font,
      required this.buttonColor,
      required this.fsize,
      required this.fontcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(9),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColor.whitecolor),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 8),
                blurRadius: 30,
                spreadRadius: 5,
                color: buttonColor.withOpacity(0.1),
              )
            ]),
        child: Center(
            child: Text(
          title,
          style: TextStyle(

              // fontWeight: font,
              fontSize: fsize,
              color: fontcolor),
        )),
      ),
    );
  }
}
