import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/ui/Home/home_screen.dart';
import '../../utils/appcolors.dart';
import '../../widgets/drop_down_Station.dart';

List names = [];
List colorList=[];
class CreateBoardScreen extends StatefulWidget {
  CreateBoardScreen({Key? key}) : super(key: key);
  @override
  State<CreateBoardScreen> createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  bool isButtonActive = true;
  var myList = [];
  TextEditingController boardnameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boardnameController = TextEditingController();
    boardnameController.addListener(() {
      final isButtonActive = boardnameController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    boardnameController.dispose();
    super.dispose();
  }

  Color colors = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.scaffoldbgcolor,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close)),
          title:  Text('newboard'.tr)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: boardnameController,
                  decoration:  InputDecoration(
                      hintText: "boardname".tr,
                      label: Text('boardname'.tr),
                      hintStyle:const TextStyle(color: Colors.grey))),
              const SizedBox(height: 20),
              const DropDownStation(),
              const VisiablltyDrapDown(),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                 Text('boardbackground'.tr, style:const TextStyle(fontSize: 17)),
                Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: colors, //background color of app from color picker
                      borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text('pickacolor!'.tr),
                                    content: SingleChildScrollView(
                                        child: MaterialPicker(
                                            pickerColor: colors, //default color
                                            onColorChanged: (Color color) {
                                              //on color picked
                                              setState(() {
                                                colors = color;});
                                            })),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          child:  Text('dONE'.tr),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); //dismiss the color picker
                                          })]);});

                          },
                        child: null,)]))
                // InkWell(
                //     onTap: () {
                //       Get.to(Home());
                //     },
                //     child: Container(
                //         height: 30,
                //         width: 30,
                //         decoration: BoxDecoration(
                //             color: colors,
                //             borderRadius: BorderRadius.circular(10))))
              ]),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(onSurface: Colors.blue),
                    onPressed: isButtonActive
                        ? () {
                            setState(() => isButtonActive = false);
                            myList.add(boardnameController.text);
                            print(myList);
                            names.addAll(myList);
                            print(myList);
                            log("Qasim: ${names}");
                            colorList.add(colors);
                            Get.to(() => HomeScreen(
                                  color: colors,));}: null,
                    child:  Text('createboard'.tr))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
