import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  String image;
  String text;
  Function()? onpress;
  SmallContainer(
      {super.key, required this.image, required this.text, this.onpress});

  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return InkWell(
      onTap: onpress,
      child: Container(
        width: mp.width * 0.4,
        height: mp.height * 0.06,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 30, width: 30, child: Image.asset(image, width: 10)),
            Text(text),
          ],
        ),
      ),
    );
  }
}
