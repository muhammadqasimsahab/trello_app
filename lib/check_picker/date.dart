import 'package:flutter/material.dart';

// ignore: must_be_immutable
class datetime extends StatelessWidget {
  var icon;
  String dateText;
  String dueText;
  Function()? onpress1;
  Function()? onpress2;
  var hinttext;
  datetime(
      {super.key,
        required this.icon,
        required this.dateText,
        required this.dueText,required this.onpress1,required this.onpress2,required this.hinttext});

  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return Container(
      height: 140,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(width: mp.width * 0.03),
              Container(
                // height: 20,
                width: mp.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(hintText: dateText,icon: InkWell(
                      onTap: onpress1,
                      child: Icon(Icons.date_range))),
                ),
              ),
              Container(
                // height: 20,
                width: mp.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: dueText,icon: Icon(Icons.date_range)),
                ),
              )

            ],
          ),

        ],
      ),
    );
  }
}