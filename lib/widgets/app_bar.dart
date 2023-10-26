import 'package:flutter/material.dart';

import '../utils/appcolors.dart';

PreferredSizeWidget setAppBar(String title) {
  return AppBar(
      backgroundColor: AppColor.scaffoldbgcolor,
      title: Text(title, style: TextStyle(color: AppColor.blackColor)),
      centerTitle: true,
      leading: Icon(Icons.more_vert_outlined,size: 25),
      // shadowColor: AppColors.scaffold_background,
      elevation: 0);
}
