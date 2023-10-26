import 'package:flutter/material.dart';
import '../../../utils/appcolors.dart';

class TextButton1 extends StatelessWidget {
  TextButton1(
      {super.key,
      required this.onpress,
      required this.icon,
      required this.text});
  Function()? onpress;
  var icon;
  String text;
  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onpress,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(
            width: mp.width * 0.03,
          ),
          Text(
            text,
            style: TextStyle(
                color: AppColor.blackColor,
                fontSize: 17,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
    // return TextButton1(

    //   onPressed:onpress,
    //   child: Row(
    //     children: [
    //       const Icon(
    //         Icons.camera_alt_outlined,
    //         color: Colors.black,
    //       ),
    //       SizedBox(
    //         width: mp.width * 0.03,
    //       ),
    //       const Text(
    //         'Take photo',
    //         style: TextStyle(
    //             color: AppColor.blackColor,
    //             fontSize: 17,
    //             fontWeight: FontWeight.w300),
    //       )
    //     ],
    //   ),
    // );
  }
}
