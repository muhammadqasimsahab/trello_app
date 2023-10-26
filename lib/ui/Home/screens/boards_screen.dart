import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appcolors.dart';
import '../../board screens/board_home_screen.dart';
import '../../board screens/create_board_screen.dart';
import '../../cards/create_card_screen.dart';
import '../../templates screen/templates_screen.dart';

class BoradsScreen extends StatefulWidget {
  Color? color;
  BoradsScreen({this.color});
  @override
  State<BoradsScreen> createState() => _BoradsScreenState();
}

class _BoradsScreenState extends State<BoradsScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  List filteredTempCropList = [];
  List cropListTemp = [];
  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionBubble(
          items: <Bubble>[
            Bubble(
              title: "browsetemplates".tr,
              iconColor: AppColor.whitecolor,
              bubbleColor: AppColor.scaffoldbgcolor,
              icon: Icons.browser_updated_rounded,
              titleStyle:
                  const TextStyle(fontSize: 16, color: AppColor.whitecolor),
              onPress: () {
                Get.to(() => const TemplatesScreen());
                // _animationController!.reverse();
              },
            ),
            Bubble(
              title: "board".tr,
              iconColor: AppColor.whitecolor,
              bubbleColor: AppColor.scaffoldbgcolor,
              icon: Icons.border_all,
              titleStyle:
                  const TextStyle(fontSize: 16, color: AppColor.whitecolor),
              onPress: () {
                _animationController!.reverse();
                Get.to(CreateBoardScreen());
              },
            ),
            // Bubble(
            //   title: "Card",
            //   iconColor: Colors.white,
            //   bubbleColor: Colors.green,
            //   icon: Icons.add_card_outlined,
            //   titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            //   onPress: () {
            //     Get.to(() => CreateCardScreen());
            //   },
            // ),
            //
            Bubble(
              title: "card".tr,
              iconColor: AppColor.whitecolor,
              bubbleColor: AppColor.scaffoldbgcolor,
              icon: Icons.add_card_outlined,
              titleStyle:
                  const TextStyle(fontSize: 16, color: AppColor.whitecolor),
              onPress: () {
                Get.to(() => CreateCardScreen());
              },
            ),
          ],
          animation: _animation!,
          onPress: () => _animationController!.isCompleted
              ? _animationController!.reverse()
              : _animationController!.forward(),
          backGroundColor: AppColor.scaffoldbgcolor,
          iconColor: AppColor.whitecolor,
          iconData: Icons.menu,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              if (names != null)
                // TextField(
                //   controller: searchController,
                // ),
                Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: names.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                              onTap: () {
                                Get.to(BoardHomeScreen(
                                    index: index, name: names[index]));
                              },
                              child: Stack(children: [
                                Container(
                                    width: mp.width * 0.5,
                                    height: mp.height * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: colorList![index],
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2.0,
                                              spreadRadius: 0.0,
                                              offset: Offset(0.0, 0.0))
                                        ])),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height: mp.height * 0.03,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(.2),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(names[index] ?? "",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: AppColor.whitecolor))))
                              ]));
                        }))
            ])));
  }

  void filterCrop(value) {
    setState(() {
      filteredTempCropList = cropListTemp
          .where((croplist) =>
              croplist.cropName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
