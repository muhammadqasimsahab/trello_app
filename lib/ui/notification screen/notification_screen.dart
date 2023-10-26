// import 'package:flutter/material.dart';
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   List items = [];
//   String _groupValue = '';
//   String text = 'All Type';
//
//   void checkRadio(String value) {
//     setState(() {
//       _groupValue = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             leading: const Icon(Icons.close),
//             title: const Text("Notifications"),
//             actions: <Widget>[
//               IconButton(
//                   icon: const Icon(Icons.check), onPressed: () {}), //IconButton
//               PopupMenuButton(
//                   itemBuilder: (context) => [
//                         PopupMenuItem(
//                             child: Row(children: const [
//                           Icon(Icons.more_vert_outlined),
//                           Text("Push notification settings")
//                         ]))
//                       ])
//             ]),
//         body: Column(
//             children: [
//           Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(color: Colors.white, boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1.3,
//                   blurRadius: 1)
//             ]),
//             child: Row(
//               children: [
//                 Container(
//                   height: 29,
//                   width: 120,
//                   padding: const EdgeInsets.only(left: 10),
//                   margin: const EdgeInsets.only(left: 10),
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           const BorderRadius.all(Radius.elliptical(11, 11)),
//                       border: Border.all(width: 0.1)),
//                   child: Row(
//                     children: [
//                       Text(_groupValue),
//                       InkWell(
//                           onTap: () {
//                             showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: <Widget>[
//                                         ListTile(
//                                             title: const Text('Me'),
//                                             leading: Radio(
//                                                 value: 'Me',
//                                                 groupValue: _groupValue,
//                                                 onChanged: (value) {
//                                                   checkRadio(value as String);
//                                                   Navigator.pop(context);
//                                                 })),
//                                         ListTile(
//                                             title: const Text('comm'),
//                                             leading: Radio(
//                                                 value: 'comm',
//                                                 groupValue: _groupValue,
//                                                 onChanged: (value) {
//                                                   checkRadio(value as String);
//                                                   Navigator.pop(context);
//                                                 }))
//                                       ]);
//                                 });
//                             // items.add(_groupValue);
//                           },
//                           child: const Icon(Icons.arrow_drop_down)),
//                       // Text(_groupValue)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ]));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/utils/appcolors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController _textController = TextEditingController();
  String _selectedOption = 'All Type';
  bool is_check = false;
  bool is_me = false;
  bool is_com = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.scaffoldbgcolor,
            leading: InkWell(
                onTap: (){
                  Get.back();},
                child: const Icon(Icons.close)),
            title: const Text("Notifications"),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.check), onPressed: () {}), //IconButton
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: Row(children: const [
                          Icon(Icons.more_vert_outlined),
                          Text("Push notification settings")
                        ]))
                      ])
            ]),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.3,
                  blurRadius: 1)]),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _bottomsheet();
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all()),
                    child: Row(
                      children: [
                        Center(child: Text(_selectedOption)),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _bottomsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Checkbox(
                    value: is_check,
                    onChanged: (value) {
                      setState(() {
                        is_check = value as bool;
                      });
                    }),
                title: const Text('All type'),
                onTap: () {
                  setState(() {
                    _selectedOption = "All type";
                    is_check = true;
                    is_me = false;
                    is_com = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Checkbox(
                    value: is_me,
                    onChanged: (value) {
                      setState(() {
                        is_com = value as bool;
                      });
                    }),
                title: const Text('Me'),
                onTap: () {
                  setState(() {
                    _selectedOption = "Me";
                    is_me = true;
                    is_check = false;
                    is_com = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Checkbox(
                    value: is_com,
                    onChanged: (value) {
                      setState(() {
                        is_com = value as bool;
                      });
                    }),
                title: const Text('Comment'),
                onTap: () {
                  setState(() {
                    _selectedOption = "Comment";
                    is_com = true;
                    is_check = false;
                    is_me = false;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
