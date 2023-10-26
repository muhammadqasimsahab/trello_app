import 'package:flutter/material.dart';

// ignore: must_be_immutable
class reuse extends StatelessWidget {
  void Function()? onTap;
  final String name;
  final String image;
  reuse(
      {super.key,
        required this.name,
        required this.image,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    double w = 300;
    double h = 50;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(
                1,
                1,
              ))
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Image.asset(
                image,
                scale: 10,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}