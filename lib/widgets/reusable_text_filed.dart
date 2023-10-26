import 'package:flutter/material.dart';

import '../utils/appcolors.dart';

class ReusableTextFiled extends StatelessWidget {
  ReusableTextFiled({super.key, this.labelText, this.hinttext});
  var labelText;
  var hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      labelText: labelText,
      hintText: hinttext,
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 17),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColor.blackColor,
        ),
      ),
    ));
  }
}
