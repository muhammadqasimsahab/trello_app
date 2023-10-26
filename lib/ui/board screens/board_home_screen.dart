import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/ui/notification%20screen/notification_screen.dart';
import 'package:images_pikcker/utils/appcolors.dart';

import '../cards/card_screen.dart';

class BoardHomeScreen extends StatefulWidget {
  int index;
  String? name;
  BoardHomeScreen({Key? key, required this.index, this.name}) : super(key: key);

  @override
  State<BoardHomeScreen> createState() => _BoardHomeScreenState();
}

class _BoardHomeScreenState extends State<BoardHomeScreen> {
  List listForCard = [];
  List cardInList = [];
  List<TextEditingController> listNameController = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();

  @override
  void dispose() {
    listForCard;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff37474f),
        title: TextFormField(
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.read_more_outlined, color: AppColor.whitecolor, size: 30),
          ),
          style: const TextStyle(color: Colors.white),
          initialValue: widget.name.toString(),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: const Icon(Icons.notifications_none, size: 25),
          ),
          const SizedBox(width: 15),
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.more_vert_outlined, size: 25),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listForCard.length + 1, // Add 1 for the "Create New List!" button
              itemBuilder: (BuildContext context, index) {
                if (index == listForCard.length) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      listForCard.add(_controller);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(),
                      primary: Colors.grey,
                    ),
                    icon: const Icon(Icons.add_circle),
                    label: const Text("Create New List!"),
                  );
                }
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                          filled: true,
                          fillColor: AppColor.greycolor,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cardInList.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              title: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.greycolor,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Card Name",
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        Get.to(() => CardScreen(index: index));
                                      },
                                      child: const Icon(Icons.add_card),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cardInList.add(_cardNameController);
                          setState(() {});
                        },
                        child: const SizedBox(child: Text("+ Add card")),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
