import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/utils/appcolors.dart';

class cont_list extends StatefulWidget {
  cont_list({super.key});

  @override
  State<cont_list> createState() => _cont_listState();
}

class _cont_listState extends State<cont_list> {
  Color bgColor = Colors.grey;
  late String text1;
  // var controller = Get.put(ImageContoller());
  List<dynamic> lebelnameList=[];
  TextEditingController _labelnamecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
         lebelnameList.toString() ,
              style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
          ),
        ),
        const SizedBox(width: 3),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      actions: [
                     const    TextField(
                            decoration:
                                InputDecoration(label: Text('Edit Lable'))),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OptionButton(Colors.blue, Colors.blue, () {
                                setState(() {
                                  bgColor = Colors.blue;
                                 lebelnameList;
                                });
                                Get.back();
                              }),
                              const SizedBox(width: 5),
                              OptionButton(Colors.red, Colors.red, () {
                                setState(() {
                                  bgColor = Colors.red;
                                });
                                Get.back();
                              }),
                              const SizedBox(width: 5),
                              // OptionButton(Colors.green, Colors.green, () {
                              //   setState(() {
                              //     bgColor = Colors.green;
                              //   });
                              //   Get.back();
                              // }),
                              // SizedBox(width: 5),
                              // OptionButton(Colors.amber, Colors.amber, () {
                              //   setState(() {
                              //     bgColor = Colors.amber;
                              //   });
                              //   Get.back();
                              // }),
                              // SizedBox(width: 5),
                              // OptionButton(Colors.purple, Colors.purple, () {
                              //   setState(() {
                              //     bgColor = Colors.purple;
                              //   });
                              //   Get.back();
                              // })
                            ]),
                        SizedBox(height: 5),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       OptionButton(Colors.pink, Colors.pink, () {
                        //         setState(() {
                        //           bgColor = Colors.pink;
                        //         });
                        //         Get.back();
                        //       }),
                        //       SizedBox(width: 5),
                        //       OptionButton(Colors.redAccent, Colors.redAccent,
                        //           () {
                        //         setState(() {
                        //           bgColor = Colors.redAccent;
                        //         });
                        //         Get.back();
                        //       }),
                        //       const SizedBox(width: 5),
                        //       OptionButton(Colors.indigo, Colors.indigo, () {
                        //         setState(() {
                        //           bgColor = Colors.indigo;
                        //         });
                        //         Get.back();
                        //       }),
                        //       SizedBox(width: 5),
                        //       OptionButton(Colors.black, Colors.black, () {
                        //         setState(() {
                        //           bgColor = Colors.black;
                        //           controller.colornameController.text.val;
                        //         });
                        //         Get.back();
                        //       }),
                        //       const SizedBox(width: 5),
                        //       OptionButton(Colors.deepOrange, Colors.deepOrange,
                        //           () {
                        //         setState(() {
                        //           bgColor = Colors.deepOrange;
                        //         });
                        //         Get.back();
                        //       })
                        //     ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.whitecolor,
                                ),
                                child: const Text('Delete',
                                    style:
                                        TextStyle(color: AppColor.blackColor))),
                            SizedBox(width: 20),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.whitecolor,
                                ),
                                child: const Text('Cancel',
                                    style:
                                        TextStyle(color: AppColor.blackColor))),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                lebelnameList.add(_labelnamecontroller);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.whitecolor,
                              ),
                              child: const Text(
                                'Done',
                                style: TextStyle(color: AppColor.blackColor),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.edit,
              size: 30,
            )),
      ],
    );
  }

  SizedBox OptionButton(Color primeryColor, Color bgColor, Function() onpress) {
    return SizedBox(
        width: 40,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: primeryColor),
            onPressed: onpress,
            child: null));
  }
}
