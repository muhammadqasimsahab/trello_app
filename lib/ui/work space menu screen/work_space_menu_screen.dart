import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../work space setting screen/work_space_setting_screen.dart';

class WorkSpaceMenuScreen extends StatefulWidget {
  const WorkSpaceMenuScreen({super.key});

  @override
  State<WorkSpaceMenuScreen> createState() => _WorkSpaceMenuScreenState();
}

class _WorkSpaceMenuScreenState extends State<WorkSpaceMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 47, 14, 194),
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.close)),
          title: const Text("Workspace menu"),
          actions:  [
            InkWell(
                onTap: (){
                  Get.to(()=>const WorkSapceSettingsScreen());
                },
                child:const Padding(
                  padding:  EdgeInsets.only(right: 15),
                  child: Icon(Icons.settings),
                )),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(spreadRadius: 2, blurRadius: 2, color: Colors.black12)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Trello Work",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 84, 12, 97),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              children:[
                                Text(
                                  "userworkspace94492244",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 84, 12, 97)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(Free)",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 84, 12, 97)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.lock,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                Text(
                                  "Private",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Image.asset(
                            "assets/icons/letter.png",width: 55,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///////////////////////////////////
            ///   Second Contaner
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(spreadRadius: 2, blurRadius: 2, color: Colors.black12)
              ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: Row(
                      children: const [
                        Icon(Icons.person),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Members",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/google.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('images/google.png'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    height: 35,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 47, 14, 194)),
                        onPressed: () {},
                        child: const Text("Invite")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}