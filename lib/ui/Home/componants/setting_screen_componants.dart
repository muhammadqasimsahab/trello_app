import 'package:flutter/material.dart';

class rowCheckBox extends StatelessWidget {
  final String text1;
  rowCheckBox({
    super.key,
    required this.text1,
  });
  double h = 15;
  double w = 80;
  bool is_check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Row(
        children: [
          Text(
            text1,
            style:const TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: w,
          ),
        ],
      ),
    );
  }
}