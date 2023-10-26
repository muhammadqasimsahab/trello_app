import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cards extends StatelessWidget {
  var icon;
  String Textfield;
  Cards({super.key, required this.icon, required this.Textfield});

  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return Container(
      height: mp.height*0.07,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.1),
              child: Icon(icon, size: 30),
            ),
            SizedBox(width: mp.width * 0.03),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 56,
                  width: mp.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: Textfield),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}