import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/utils/appimages.dart';
import '../../utils/appcolors.dart';
import '../../widgets/bottom_sheet.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.scaffoldbgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(welcomescreenlogo,
                color: AppColor.whitecolor),
            SizedBox(height: mp.height * 0.10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Image.asset(welcomescreenimages),
            ),
            SizedBox(height: mp.height * 0.04),
             Text('welcomeScreentext1'.tr,
                textAlign: TextAlign.center,
                style:const TextStyle(
                    color: AppColor.whitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            BottomSheetAll(
                title: 'welcomescreensignupbottontext'.tr,
                height: mp.height * 0.05,
                width: mp.width * 0.8,
                // font: FontWeight.w500,
                fontcolor: AppColor.scaffoldbgcolor,
                fsize: 16,
                buttonColor: AppColor.whitecolor),
            BottomSheetAll(
                title: 'welcomescreenLoginbottontext'.tr,
                height: mp.height * 0.05,
                width: mp.width * 0.8,
                // font: FontWeight.w500,
                fontcolor: Colors.white,
                fsize: 16,
                buttonColor: AppColor.scaffoldbgcolor),
            SizedBox(height: mp.height * 0.01),
             Text(
              'welcomeScreentext2'.tr,
              textAlign: TextAlign.center,
              style:const  TextStyle(color: AppColor.whitecolor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
