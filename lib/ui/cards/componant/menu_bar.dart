import 'package:flutter/material.dart';

Widget _simplePopup() => PopupMenuButton<int>(
  itemBuilder: (context) => [
    const PopupMenuItem(
      value: 1,
      child: Text("First"),
    ),
    const PopupMenuItem(
      value: 2,
      child: Text("Second"),
    ),
  ],
);