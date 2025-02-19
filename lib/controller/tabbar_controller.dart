import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {

  final List<Tab> myTabs = const <Tab>[

    Tab(text: 'LEFT'),

    Tab(text: 'RIGHT'),

  ];

  late TabController controller;

  @override

  void onInit() {

    super.onInit();

    controller = TabController(vsync: this, length: myTabs.length);

  }

  @override

  void onClose() {

    controller.dispose();

    super.onClose();

  }

}