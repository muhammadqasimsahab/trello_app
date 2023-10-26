import 'package:flutter/material.dart';

import 'appcolors.dart';

PreferredSizeWidget setAppBar(String title) {
  return AppBar(
      backgroundColor: AppColor.Homewcreenwidgetbordercolor,
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontSize: 29, fontWeight: FontWeight.w800)),
      centerTitle: true,
      leading: Container(),
      // leading: Image.asset(AppImages.appBarIcon),
      // shadowColor: AppColors.scaffold_background,
      elevation: 0);
}
