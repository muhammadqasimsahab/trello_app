import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../ui/cards/componant/controller.dart';

class HomePage extends StatelessWidget {
  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  HomePage({super.key, required this.pickedFile});
  ImageContoller imagecontroller = Get.put(ImageContoller());
  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
            ////////////////////////////////////// Cards body
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(
                          () => Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imagecontroller.isprofilePicPathset.value ==
                                    true
                                    ? FileImage(File(
                                    imagecontroller.profilePicPath.value))
                                as ImageProvider
                                    : AssetImage(
                                  "images/grey.jpg",
                                ),
                              ))),
                    ),
                    Positioned(
                      left: 12,
                      bottom: 0,
                      child: InkWell(
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => bottomSheet(context));
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20
                ),

                ]),

            ),
          ),
        ),

    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(
        children: [
          Text(
            'Chose Cover',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    takephoto(ImageSource.gallery);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        size: 40,
                      ),
                      Text('Gallery')
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: () {
                    takephoto(ImageSource.camera);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_sharp,
                        size: 40,
                      ),
                      Text('Camera')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> takephoto(ImageSource source) async {
    final pickedImage =
    await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    imagecontroller.setProfileImagePath(pickedFile!.path);
    Get.back();
  }
}