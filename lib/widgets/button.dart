import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.buttontext,
      this.buttoncolor,
      this.buttontextcolor,
      required this.onpress})
      : super(key: key);
  var buttontext;
  var buttoncolor;
  var buttontextcolor;
  Function() onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 31.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          primary: buttoncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          // elevation: 15.0,
        ),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 20, color: buttontextcolor),
        ),
      ),
    );
  }
}
