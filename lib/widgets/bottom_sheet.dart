import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/ui/auth/auth.dart';
import 'package:images_pikcker/utils/appimages.dart';
import '../ui/signup screens/signup_screen.dart';
import '../utils/appcolors.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart' as pro;

class BottomSheetAll extends StatelessWidget {
  String title;

  double height;
  double width;
  // var font;
  var buttonColor;
  double fsize;
  var fontcolor;

  BottomSheetAll(
      {super.key,
      required this.title,
      required this.height,
      required this.width,
      // required this.font,
      required this.buttonColor,
      required this.fsize,
      required this.fontcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                  height: 215,
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(() => signUpScreen());
                                  },
                                  child: Row(children:  [
                                  const  Icon(Icons.mail_outline),
                                  const  SizedBox(width: 15),
                                    Text('sIGNUPWITHEMAIL'.tr)
                                  ])),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: (){
                                  final provider=pro.Provider.of<GoogleSignInProvider>(context,listen:false);
                                  provider.googleLogin();
                                  Navigator.pop(context);
                                },
                                child: Row(children: [
                                  SvgPicture.asset(
                                   emailimage,
                                    width: 30),
                                  const SizedBox(width: 15),
                                   Text('sIGNUPWITHGOOGLE'.tr)
                                ]),
                              ),
                              const SizedBox(height: 20),
                              Row(children: [
                                SvgPicture.asset(
                                  microsoftimage,
                                  width: 30,
                                ),
                                const SizedBox(width: 15),
                                const Text('SIGN UP WITH MICROSOFT')
                              ]),
                              const SizedBox(height: 20),
                              Row(children: [
                                SvgPicture.asset(
                                  'assets/icons/apple.svg',
                                  width: 30,
                                ),
                                const SizedBox(width: 15),
                                const Text('SIGN UP WITH APPLE')
                              ])
                            ]))
                      ]));
            });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(9),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColor.whitecolor),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 8),
                blurRadius: 30,
                spreadRadius: 5,
                color: buttonColor.withOpacity(0.1),
              )
            ]),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              // fontWeight: font,
              fontSize: fsize,
              color: fontcolor),
        )),
      ),
    );
  }
}
