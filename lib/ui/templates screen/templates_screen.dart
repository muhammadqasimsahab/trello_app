import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_pikcker/utils/appcolors.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
             backgroundColor: AppColor.scaffoldbgcolor,
            title:const  Text('Start With Templates'),
            leading:InkWell(
                onTap: (){
                  Get.back();},
                child: const Icon(Icons.close)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child:  TabBar(

                    isScrollable: true,
                    labelColor: Colors.black,
                    tabs: const [
                    Tab(text: 'All'),
                    Tab(text: "Business"),
                    Tab(text: 'Design'),
                    Tab(text: 'Education'),Tab(text: 'Engineering'),Tab(text: 'Marketing'),
                  ],
                    indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        color: Colors.blue),
                  ),
                ),
                const Expanded(
                    child: TabBarView(children: [
                  Center(child: Text('Page All')),
                  Center(child: Text('Page Business')),
                  Center(child: Text('Page Design')),
                  Center(child: Text('Page Education')), Center(child: Text('Page Engineering')), Center(child: Text('Page Marketing')),
                ]))
              ],
            ),
          ),
        ));
  }
}
