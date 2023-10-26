import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class about_trello_app extends StatelessWidget {
  String name;
  var image;
  void Function()? onTap;

  about_trello_app(
      {super.key,
        required this.image,
        required this.name,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 25,
        ),
        const SizedBox(
          width: 25,
        ),
        InkWell(onTap: onTap, child: Text(name))
      ],
    );
  }
}