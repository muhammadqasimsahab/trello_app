import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkSapceSettingsScreen extends StatefulWidget {
  const WorkSapceSettingsScreen({super.key});

  @override
  State<WorkSapceSettingsScreen> createState() => _WorkSapceSettingsScreenState();
}

class _WorkSapceSettingsScreenState extends State<WorkSapceSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 47, 14, 194),
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Workspace settings"),
        ),
        body: Column(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(spreadRadius: 2, blurRadius: 2, color: Colors.black12)
              ]),
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 9, 73),
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Trello work",
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 9, 73),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Visibility",
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 9, 73),
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Private",
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 9, 73),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Text(
                "Not all settings are editable on mobile.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}