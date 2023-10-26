import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
List sendColorList=[];
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color mycolor = Colors.lightBlue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Color Picker"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            color: mycolor, //background color of app from color picker
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: MaterialPicker(
                              pickerColor: mycolor, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                setState(() {
                                  mycolor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                // Get.to(()=>CreateCardScreen());
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                               sendColorList.add(mycolor);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text("Material Color Picker"),
              ),
            ])));
  }
}
