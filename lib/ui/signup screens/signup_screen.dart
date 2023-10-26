import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/ui/Home/home_screen.dart';
import 'package:images_pikcker/utils/appcolors.dart';
import 'package:images_pikcker/utils/appimages.dart';

import '../../widgets/signup_contianer_reuable.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  double w = 300;
  double h = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 90),
          child: Column(
            children: [
              // title of trello app text
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                child: Row(
                  children: [
                    Image.asset(
                      singupscreenlogo,
                      scale: 9,
                    ),
                    const SizedBox(width: 13),
                    Text(
                      'signuptitle'.tr,
                      style: const TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // text
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('signuptocontinue'.tr),
              ),
              const SizedBox(height: 12),
              // textfild
              SizedBox(
                height: h,
                width: w,
                child: TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'enteryouremail'.tr,
                        hintStyle: const TextStyle(
                            color: AppColor.blackColor, fontSize: 10))),
              ),
              // text of textfild
              Row(
                children: [
                  Text(
                    'bysigningup,iaccepttheatlassian'.tr,
                    style: const TextStyle(
                        fontSize: 13, color: AppColor.blackColor),
                  ),
                  const SizedBox(width: 2),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'cloudtermsofservice'.tr,
                      style: const TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Row(children: [
                    Text(
                      'andacknowledgethe'.tr,
                      style: const TextStyle(
                          fontSize: 13, color: AppColor.blackColor),
                    ),
                    const SizedBox(width: 2),
                    Text('privacy'.tr,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.blue))
                  ])),

              const SizedBox(height: 12),
              // signup button
              SizedBox(
                  height: h,
                  width: w,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => HomeScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 17, 6, 170)),
                      child: Text('signup'.tr,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)))),

              const SizedBox(height: 15),
              // or text
              Text(
                'or'.tr,
                style: const TextStyle(color: AppColor.greycolor, fontSize: 11),
              ),
              const SizedBox(height: 15),
              // contaner gamil, microfot, apple, slack
              reuse(
                name: 'continuwithgoogle'.tr,
                image: googlesignupimage,
                onTap: () {},
              ),
              SizedBox(
                height: 15,
              ),
              reuse(
                  name: 'continuwithmicrosoft'.tr,
                  image: microsoftsignupimage,
                  onTap: () {}),
              const SizedBox(height: 15),
              reuse(
                  name: 'continuwithaplle'.tr,
                  image: applesignupimage,
                  onTap: () {}),
              const SizedBox(height: 15),
              reuse(
                  name: 'continuwithslack'.tr,
                  image: slacksignupimage,
                  onTap: () {}),
              const SizedBox(height: 15), // divider
              const Divider(
                  indent: 31, endIndent: 31, thickness: 1, color: Colors.grey),
              const SizedBox(height: 9),
              // text
              Padding(
                  padding: const EdgeInsets.only(
                    left: 80,
                  ),
                  child: Row(children: [
                    Image.asset(atlassiansingupimage, scale: 2),
                    const SizedBox(width: 13),
                    Text('aTLASSIAN'.tr,
                        style: const TextStyle(
                            color: AppColor.greycolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))
                  ])),
              const SizedBox(width: 18),
              // text navigator
              Text('thispageisprotectedbyreCAPTCHAandthegoogle'.tr,
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
              InkWell(
                onTap: () {},
                child: Text('privacypolicyandtermsofserviceapply'.tr,
                    style: const TextStyle(color: Colors.blue, fontSize: 13)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
