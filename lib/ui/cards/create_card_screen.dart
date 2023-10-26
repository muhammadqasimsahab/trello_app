import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appcolors.dart';
import '../../widgets/contact_list.dart';
import 'componant/drapdown_for_create_card_screen.dart';

class CreateCardScreen extends StatefulWidget {
  String? name;
  String? number;

  CreateCardScreen({this.name, this.number});
  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  bool isTrue = false;
  bool isVisible = false;
  List<Contact>? _contacts;
  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.scaffoldbgcolor,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close)),
          title: const Text('New Board')),
      body: Stack(
        children: [
          Container(
            color: AppColor.scaffoldbgcolor,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: mp.height * 0.4,
              color: AppColor.whitecolor,
              child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Card Name",
                          hintStyle: TextStyle(color: Colors.grey))),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Description",
                          hintStyle: TextStyle(color: Colors.grey))),
                  SizedBox(height: mp.height * 0.01),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(() => ContactShowScreen());
                          },
                          color: AppColor.scaffoldbgcolor,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.person, size: 24),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 190,
                        child: ListView.builder(
                            itemCount: _contacts?.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                title: Text(widget.name.toString()),
                                leading: const CircleAvatar(
                                    child: Icon(Icons.person, size: 30)),
                              );
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time_outlined),
                              const SizedBox(width: 15),
                              InkWell(
                                  onTap: () {
                                    showAlertDialog(context);
                                  },
                                  child: Text(
                                    'Starting Date',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ))
                            ],
                          ),
                          const Divider(),
                          const SizedBox(width: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 38),
                            child: InkWell(
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Text(
                                  'Due Date',
                                  style: TextStyle(color: Colors.grey[600]),
                                )),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: const [
                              Icon(Icons.attachment_outlined),
                              SizedBox(width: 10),
                              Text('Attachments...'),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Done"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Start Date"),
      content: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 50, child: const DaysDrapDown()),
            const SizedBox(width: 30),
            Container(height: 50, child: TimeDrapDown()),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
