import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageContoller extends GetxController {
  var isprofilePicPathset = false.obs;
  var profilePicPath = "".obs;
  var isprofilePicPathset2 = false.obs;
  var profilePicPath2 = "".obs;

  var isChecked = false.obs;
  // TextEditingController colornameController=TextEditingController();


  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isprofilePicPathset.value = true;
  }

  void setProfileImagePath2(String path) {
    profilePicPath2.value = path;
    isprofilePicPathset2.value = true;
  }
}