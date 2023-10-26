import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internationalization/internationalization.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../check_picker/check_card.dart';
import '../../model/todo.dart';
import '../../utils/appcolors.dart';
import 'componant/color_list.dart';
import 'componant/componants.dart';
import 'componant/componants_for_dialogbar.dart';
import 'componant/controller.dart';
import 'componant/todo_items.dart';

enum SampleItem {
  itemOne,
  itemTwo,
  itemThree,
  itemfoure,
  itemfave,
  item6,
  item7,
  item8
}

class CardScreen extends StatefulWidget {
  var index;
  CardScreen({super.key, required this.index});
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  bool isVisible = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  File? pickedFile;
  // late List<FilePickerResult> result=[];
  List<PlatformFile> files = [];
  ImagePicker imagePicker = ImagePicker();
  ImageContoller imagecontroller = Get.put(ImageContoller());
  final _todoController = TextEditingController();
  //////////////////////////start date///////////////////////////////////////////////
  String _selectedDate = "Start Date";
  String _selectedDateend = "End Date";
  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? d = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat.yMMMd('en_us').format(d).toString();
        // _selectedDateend = new DateFormat.yMMMd('en_us').format(d).toString();
      });
    }
  }

  Future<void> _openDatePickerend(BuildContext context) async {
    final DateTime? d = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));
    if (d != null) {
      setState(() {
        // _selectedDate = new DateFormat.yMMMd('en_us').format(d).toString();
        _selectedDateend = DateFormat.yMMMd('en_us').format(d).toString();
      });
    }
  }
  /////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  var controller = Get.put(ImageContoller());
  @override
  Widget build(BuildContext context) {
    //show popup dialog
    var mp = MediaQuery.of(context).size;
    SampleItem? selectedMenu;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            // appBar: setAppBar('Create Crad'),
            body: SingleChildScrollView(
                child: Column(children: [
              //cover images section strat
              Column(children: [
                Stack(children: [
                  Obx(() => Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imagecontroller
                                          .isprofilePicPathset.value ==
                                      true
                                  ? FileImage(File(
                                          imagecontroller.profilePicPath.value))
                                      as ImageProvider
                                  : const AssetImage(
                                      "assets/images/grey.jpeg"))))),
                  Positioned(
                    left: 12,
                    bottom: 0,
                    child: InkWell(
                      child: const Icon(Icons.camera_alt, size: 30),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => bottomSheet(context));
                      },
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.close)),
                  Align(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton<SampleItem>(
                          initialValue: selectedMenu,
                          // Callback that sets the selected popup menu item.
                          onSelected: (SampleItem item) {
                            setState(() {
                              selectedMenu = item;
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemOne,
                                  child: Text('Share card link'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemTwo,
                                  child: Text('Remove card cover'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemThree,
                                  child: Text('Stop watching'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemThree,
                                  child: Text('Move card'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemThree,
                                  child: Text('Copy card'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemThree,
                                  child: Text('Archive'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemThree,
                                  child: Text('Pine to home screen'),
                                ),
                                const PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemThree,
                                    child: Text('Delete',
                                        style: TextStyle(color: Colors.red)))
                              ]))
                ]),
                const SizedBox(height: 20),
              ]),
              //cover images section end
              //title contianer strat
              Container(
                  height: mp.height * 0.3,
                  padding: EdgeInsets.symmetric(horizontal: mp.width * 0.03),
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Title', style: TextStyle(fontSize: 25)),
                        const Text('Title in list To Do'),
                        const Divider(),
                        SizedBox(height: mp.height * 0.01),
                        const Text('Quick Actions',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(height: mp.height * 0.01),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallContainer(
                                  onpress: () {
                                    setState(
                                      () {
                                        isVisible = !isVisible;
                                      },
                                    );
                                  },
                                  image: ("assets/images/chec.png"),
                                  text: "Add Checklist"),
                              InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                        // buttonColor: Colors.amber,
                                        title: "Attach from...",
                                        backgroundColor: AppColor.whitecolor,
                                        titleStyle:
                                            const TextStyle(color: Colors.grey),
                                        content: Column(children: [
                                          TextButton1(
                                              icon: Icons.camera_alt_outlined,
                                              text: "Take Photo",
                                              onpress: () {
                                                takephoto2(ImageSource.camera);
                                              }),
                                          TextButton1(
                                              icon: Icons.attach_file_outlined,
                                              text: "File",
                                              onpress: () async {
                                                final result = (await FilePicker
                                                    .platform
                                                    .pickFiles(
                                                        allowMultiple: true));
                                                Navigator.pop(context);
                                                if (result == null) return;
                                                setState(() {
                                                  files = result.files;
                                                });
                                              }),
                                          TextButton1(
                                              icon: Icons.link,
                                              text: "Attach a link",
                                              onpress: () {}),
                                          TextButton1(
                                              icon: Icons.bar_chart,
                                              text: "Trello",
                                              onpress: () {})
                                        ]));
                                  },
                                  child: SmallContainer(
                                      image: ("assets/images/attach.png"),
                                      text: "Add Attachment"))
                            ]),
                        SizedBox(height: mp.height * 0.03),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return SizedBox(
                                              height: 215,
                                              width: double.infinity,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        child:
                                                            Column(children: [
                                                          const Text(
                                                              'Add New Text Filed',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18)),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  isVisible2 =
                                                                      !isVisible2;
                                                                });
                                                                Get.back();
                                                              },
                                                              child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                        'assets/icons/t-mobile.png',
                                                                        width:
                                                                            20),
                                                                    const SizedBox(
                                                                        width:
                                                                            15),
                                                                    const Text(
                                                                        'Text')
                                                                  ])),
                                                          const SizedBox(
                                                              height: 20),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  isVisible3 =
                                                                      !isVisible3;
                                                                });
                                                                Get.back();
                                                              },
                                                              child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                        'assets/icons/hash.png',
                                                                        width:
                                                                            30),
                                                                    const SizedBox(
                                                                        width:
                                                                            15),
                                                                    const Text(
                                                                        'Number')
                                                                  ])),
                                                          const SizedBox(
                                                              height: 20),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  isVisible4 =
                                                                      !isVisible4;
                                                                });
                                                                Get.back();
                                                              },
                                                              child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                        'assets/icons/check.png',
                                                                        width:
                                                                            30),
                                                                    const SizedBox(
                                                                        width:
                                                                            15),
                                                                    const Text(
                                                                        'Check Box')
                                                                  ]))
                                                        ]))
                                                  ]));
                                        });

                                    // isVisible2 = !isVisible2;
                                  });
                                },
                                child: SmallContainer(
                                    image: ("assets/images/database.png"),
                                    text: "Custom Fields"),
                              ),
                              SmallContainer(
                                  image: ("assets/images/user.png"),
                                  text: "Members")
                            ])
                        //1st Continer
                      ])),
              //title container end
              SizedBox(height: mp.height * 0.03),
              //description container start
              Container(
                  height: mp.height * 0.1,
                  width: double.infinity,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.library_books_outlined, size: 30),
                        SizedBox(width: mp.width * 0.03),
                        Container(
                            height: mp.height * 0.1,
                            width: mp.width * 0.8,
                            color: Colors.white,
                            child: const TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Add card description...")))
                      ])),
              SizedBox(height: mp.height * 0.02),
              //////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                  height: mp.height * 0.07,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        setState(() {
                          isVisible5 = !isVisible5;
                        });
                      },
                      child: Row(children: const [
                        Icon(
                          Icons.label_important_outline,
                          size: 28,
                          color: Color.fromARGB(255, 49, 48, 48),
                        ),
                        SizedBox(width: 15),
                        Text('Lebel...',
                            style: TextStyle(fontSize: 16, color: Colors.grey))
                      ]))),
              Container(
                child: Visibility(
                    visible: isVisible5,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return cont_list();
                      },
                    )),
              ),
              //////////////////////////////////////////////////////////////////////////////////////////////

              //description container end
              SizedBox(height: mp.height * 0.03),
              Cards(
                  Textfield: "Member...", icon: Icons.label_important_outline),
              //description container end
              SizedBox(height: mp.height * 0.03),
              /////////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          SizedBox(width: mp.width * 0.03),
                          Container(
                              child: Row(children: [
                            InkWell(
                                onTap: () {
                                  _openDatePicker(context);
                                },
                                child: const Icon(Icons.date_range)),
                            const SizedBox(width: 20),
                            Text(_selectedDate)
                          ])),
                          const Divider(),
                          Container(
                              child: Row(children: [
                            InkWell(
                                onTap: () {
                                  _openDatePickerend(context);
                                },
                                child: const Icon(Icons.date_range)),
                            const SizedBox(width: 20),
                            Text(_selectedDateend)
                          ]))
                        ])
                      ])),
              //////////////////////////////////////////////////////////////////////////////////////////////////
              const SizedBox(height: 20),
              Cards(Textfield: 'Location...', icon: Icons.location_on),
              const SizedBox(height: 8),
              Container(
                  color: AppColor.whitecolor,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Image Attachments',
                            style: TextStyle(fontSize: 18)),
                        SizedBox(height: mp.height * 0.01),
                        const Divider(),
                        Obx(() => Container(
                            height: 120,
                            width: 150,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: imagecontroller
                                                .isprofilePicPathset2.value ==
                                            true
                                        ? FileImage(File(imagecontroller
                                            .profilePicPath2
                                            .value)) as ImageProvider
                                        : const AssetImage(
                                            "assets/images/grey.jpeg")))))
                      ])),
              SizedBox(height: mp.height * 0.03),
              //////////////Add checkList start///////////////////////////////////////////////////////////////////
              Visibility(
                  visible: isVisible,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      // height: mp.height * 0.06,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(children: [
                        const Text('Add Items to CheckList',
                            textAlign: TextAlign.start),
                        Container(
                            height: 200,
                            child: ListView(children: [
                              for (ToDo todoo in _foundToDo.reversed)
                                ToDoItem(
                                    todo: todoo,
                                    onToDoChanged: _handleToDoChange,
                                    onDeleteItem: _deleteToDoItem)
                            ])),
                        Row(children: [
                          Expanded(
                              child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: _todoController,
                              decoration: InputDecoration(
                                  hintText: 'add a new todo item',
                                  icon: const Icon(Icons.add),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(width: 2))),
                            ),
                          )),
                          const SizedBox(width: 20),
                          Container(
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _addToDoItem(_todoController.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      // minimumSize: const Size(60, 60),
                                      elevation: 10),
                                  child: const Text('+',
                                      style: TextStyle(fontSize: 20))))
                        ])
                      ]))),
              //////////////Add checklist End///////////////////////////////////////////////////////////////////
              const SizedBox(height: 12),
              Visibility(
                  visible: isVisible2,
                  child: Container(
                      height: mp.height * 0.07,
                      // width: double.infinity,
                      color: Colors.white,
                      child: ListTile(
                          // title: Text("Price"),
                          trailing: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.text_fields_sharp),
                                      labelText: "Add Text Filed...")))))),
              const SizedBox(height: 12),
              Visibility(
                  visible: isVisible3,
                  child: Container(
                      height: mp.height * 0.07,
                      width: double.infinity,
                      color: Colors.white,
                      child: ListTile(
                          // title: Text("Price"),
                          trailing: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.text_fields_sharp),
                                      labelText: "Add Number Filed...")))))),
              //start check box view
              const SizedBox(height: 12),
              Visibility(
                  visible: isVisible4,
                  child: Container(
                      height: mp.height * 0.07,
                      color: AppColor.whitecolor,
                      child: Obx(() => CheckboxListTile(
                          title: const TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.blackColor)))),
                          secondary: const Icon(Icons.check_circle_outline,
                              color: AppColor.blackColor),
                          value: controller.isChecked.value,
                          onChanged: (value) {
                            controller.isChecked.value =
                                !controller.isChecked.value;
                            print(controller.isChecked.value);
                            print("${value}");
                            var Value = controller.isChecked.value;
                          })))),
              //end check box view
              ///////////////////Start PDF File View//////////////////////////////////////////////////////////////////
              const SizedBox(height: 12),
              if (files.isNotEmpty)
                Container(
                    // height: mp.height*0.3,
                    width: double.infinity,
                    color: AppColor.whitecolor,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('PDF File Attachments'),
                          Center(
                              child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(16),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8),
                                  itemCount: files.length,
                                  itemBuilder: (context, index) {
                                    final file = files[index];
                                    return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: ListTile(
                                                  leading: const Icon(Icons
                                                      .attachment_outlined),
                                                  title: Text(file.name)))

                                          // Text(fileSize)
                                        ]);
                                  }))
                        ])),
              ///////////////////End PDF File View//////////////////////////////////////////////////////////////////
              SizedBox(height: mp.height * 0.2),

              Container(
                  margin: const EdgeInsets.all(12.0),
                  height: 60,
                  child: Row(children: [
                    Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: InkWell(
                            child: profileImage(),
                            onLongPress: () => callVoice())),
                    // SizedBox(width: 5),
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 7,
                                    color: Colors.grey)
                              ],
                            ),
                            child: Row(children: [
                              moodIcon(),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Message",
                                      hintStyle:
                                          TextStyle(color: Color(0xFF00BFA5)),
                                      border: InputBorder.none),
                                ),
                              ),
                              camera()
                            ]))),
                    // const SizedBox(width: 15),
                    Container(
                        // padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: InkWell(
                            child: attachFile(),
                            onLongPress: () => attachFile()))
                  ]))
            ]))));
  }

//function for change the states of CheckList checked
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  //
  //function for delete the items form checkList
  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  //function  for add the items to CheckList
  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  /////////////////////////////////////////////
  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  // void openFiles(List<PlatformFile>files)=>
  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
  //     FilePage(files:files,
  // onOpenedFile:openFile,)));

  /////////////////////////////////////////////

  //
  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.3,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(children: [
          const Text('Chose Cover',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    takephoto(ImageSource.gallery);
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.image, size: 40),
                      Text('Gallery')
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                InkWell(
                    onTap: () {
                      takephoto(ImageSource.camera);
                    },
                    child: const Column(children: [
                      Icon(
                        Icons.camera_alt_sharp,
                        size: 40,
                      ),
                      Text('Camera')
                    ]))
              ]))
        ]));
  }

  Future<void> takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    imagecontroller.setProfileImagePath(pickedFile!.path);
    Get.back();
  }

  Future<void> takephoto2(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    imagecontroller.setProfileImagePath2(pickedFile!.path);
    Get.back();
  }

  ////////////////////App Bar Menu Function/////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////
  void callEmoji() {
    print('Emoji Icon Pressed...');
  }

  void callAttachFile() {
    print('Attach File Icon Pressed...');
  }

  void callCamera() {
    print('Camera Icon Pressed...');
  }

  void callVoice() {
    print('Voice Icon Pressed...');
  }

  Widget moodIcon() {
    return IconButton(
        icon: const Icon(
          Icons.mood,
          color: Color(0xFF00BFA5),
        ),
        onPressed: () => callEmoji());
  }

  Widget attachFile() {
    return IconButton(
      icon: const Icon(Icons.attach_file, color: Color(0xFF00BFA5)),
      onPressed: () => callAttachFile(),
    );
  }

  Widget camera() {
    return IconButton(
      icon: const Icon(Icons.send, color: Color(0xFF00BFA5)),
      onPressed: () => callCamera(),
    );
  }

  Widget voiceIcon() {
    return const Icon(
      Icons.keyboard_voice,
      color: Colors.white,
    );
  }

  Widget profileImage() {
    return SvgPicture.asset(
      'assets/images/profilepic.svg',
      width: 50,
    );
  }
}
