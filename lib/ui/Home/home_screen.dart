import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/ui/Home/screens/boards_screen.dart';
import 'package:images_pikcker/ui/Home/screens/highlight_Screen.dart';
import 'package:images_pikcker/ui/notification%20screen/notification_screen.dart';
import 'package:images_pikcker/ui/work%20space%20menu%20screen/work_space_menu_screen.dart';
import 'package:images_pikcker/utils/appimages.dart';
import '../../utils/appcolors.dart';
import 'componants/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  Color? color;
  HomeScreen({this.color});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // Animation<double>? _animation;
  // AnimationController? _animationController;

 // @override
  // void initState() {
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 260),
  //   );
  //
  //   final curvedAnimation =
  //       CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
  //   _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  //
  //   super.initState();
  // }
  // final MyTabController _tabx = Get.put(MyTabController());
  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    //Side bar  globle key
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
    final user = FirebaseAuth.instance.currentUser!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.grey[120],
        appBar: AppBar(
          backgroundColor: AppColor.scaffoldbgcolor,
          title: Text('homescreentitle'.tr),
          leading: InkWell(
              onTap: () {
                //Side bar  globle key
                _globalKey.currentState!.openDrawer();
              },
              child: const Icon(Icons.menu, size: 25)),
          actions: [
            // const Icon(Icons.search, size: 25),
            const SizedBox(width: 15),
            InkWell(
                onTap: () {
                  Get.to(() => NotificationScreen());
                },
                child: const Icon(Icons.notifications_none, size: 25)),
            const SizedBox(width: 15),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                    onTap: () {
                      Get.to(const WorkSpaceMenuScreen());
                    },
                    child: const Icon(Icons.more_horiz_outlined, size: 25)))
          ],
          bottom:  TabBar(
            tabs: [
              Text('bOARD'.tr,  style:const TextStyle(fontSize: 15)),
              Text('hIGHLIGHT'.tr, style:const TextStyle(fontSize: 15)),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionBubble(
        //   items: <Bubble>[
        //     Bubble(
        //       title: "Browse templates",
        //       iconColor: Colors.white,
        //       bubbleColor: Colors.green,
        //       icon: Icons.browser_updated_rounded,
        //       titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
        //       onPress: () {
        //         _animationController!.reverse();
        //       },
        //     ),
        //     Bubble(
        //       title: "Board",
        //       iconColor: Colors.white,
        //       bubbleColor: Colors.green,
        //       icon: Icons.border_all,
        //       titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
        //       onPress: () {
        //         _animationController!.reverse();
        //         Get.to(CreateBoardScreen());
        //       },
        //     ),
        //     // Bubble(
        //     //   title: "Card",
        //     //   iconColor: Colors.white,
        //     //   bubbleColor: Colors.green,
        //     //   icon: Icons.add_card_outlined,
        //     //   titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
        //     //   onPress: () {
        //     //     Get.to(() => CreateCardScreen());
        //     //   },
        //     // ),
        //     //
        //     Bubble(
        //       title: "Card",
        //       iconColor: Colors.white,
        //       bubbleColor: Colors.green,
        //       icon: Icons.add_card_outlined,
        //       titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
        //       onPress: () {
        //         Get.to(() => CreateCardScreen());
        //       },
        //     ),
        //   ],
        //   animation: _animation!,
        //   onPress: () => _animationController!.isCompleted
        //       ? _animationController!.reverse()
        //       : _animationController!.forward(),
        //   backGroundColor: Colors.green,
        //   iconColor: Colors.white,
        //   iconData: Icons.menu,
        // ),
        body: TabBarView(
          children: [
            BoradsScreen(color: widget.color),
            const highLight_Screen(),
          ],
        ),
        //Padding(
        //       padding: const EdgeInsets.all(15),
        //       child: Column(
        //         children: [
        //           if (names != null)
        //             Expanded(
        //                 child: GridView.builder(
        //                     gridDelegate:
        //                         const SliverGridDelegateWithMaxCrossAxisExtent(
        //                             maxCrossAxisExtent: 200,
        //                             childAspectRatio: 3 / 2,
        //                             crossAxisSpacing: 20,
        //                             mainAxisSpacing: 20),
        //                     itemCount: names.length,
        //                     itemBuilder: (BuildContext context, index) {
        //                       return InkWell(
        //                         onTap: (){
        //                        Get.to(BoardHomeScreen(index: index));
        //                         },
        //                         child: Container(
        //                             width: mp.width * 0.1,
        //                             height: mp.height * 0.1,
        //                             color: AppColor.whitecolor,
        //                             child: Align(
        //                               alignment: Alignment.bottomCenter,
        //                               child: Container(
        //                                 height: mp.height * 0.03,
        //                                 width: double.infinity,
        //                                 color: Colors.grey[300],
        //                                 child: Text(names[index] ?? ""),
        //                               ),
        //                             )),
        //                       );
        //                     })),
        //         ],
        //       ),
        //     ),
        drawer: Container(
          child: Drawer(
            shape: const RoundedRectangleBorder(),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 2, top: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 200,
                      width: double.infinity,
                      color: AppColor.scaffoldbgcolor,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 65, left: 14),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(user.photoURL!),
                                  radius: 30,
                                ),
                                const SizedBox(height: 15),
                                Text(user.displayName!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(user.email!,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                const SizedBox(height: 3),
                                // const Text('yasirkhan2624@gmail.com',
                                //     style: TextStyle(color: Colors.white))
                              ]))),
                  SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[200]),
                          child: Row(children: [
                            Image.asset(
                              drawerimage1,
                              scale: 9
                            ),
                            const SizedBox(width: 25),
                             Text('board'.tr,
                                style:const  TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ]))),
                  const Divider(height: 15, color: AppColor.greycolor),
                   Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('workspaces'.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14))),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Drewerslider(
                            title: 'workspace',
                            icon: Icons.people_outline,
                            icons: Icons.more_horiz_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 10, color: AppColor.greycolor),
                  const SizedBox(height: 15),
                  InkWell(
                      onTap: () {},
                      child:  Drewerslider(
                          title: 'mycards'.tr,
                          icon: Icons.card_membership,
                          icons: null)),
                  InkWell(
                      onTap: () {},
                      child:  Drewerslider(
                          title: 'Offlineboards'.tr,
                          icon: Icons.border_all_outlined,
                          icons: null)),
                  InkWell(
                    onTap: () {
                      Get.to(() => const SettingScrren());
                    },
                    child:  Drewerslider(
                      title: 'Setting'.tr,
                      icon: Icons.settings,
                      icons: null,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child:  Drewerslider(
                      title: 'help!'.tr,
                      icon: Icons.help_outline_sharp,
                      icons: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//side bar class extrat widgt drewer side bare
class Drewerslider extends StatelessWidget {
  final String title;
  final IconData icon;
  final icons;
  const Drewerslider({
    super.key,
    required this.title,
    required this.icon,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 28),
          const SizedBox(width: 25),
          Text(
            title,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
          const SizedBox(width: 100),
          Icon(icons, color: Colors.black54, size: 25)
        ],
      ),
    );
  }
}
