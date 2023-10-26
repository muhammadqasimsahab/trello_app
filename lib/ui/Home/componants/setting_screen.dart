import 'package:flutter/material.dart';
import 'package:images_pikcker/ui/Home/componants/setting_screen_componants.dart';
import 'package:images_pikcker/utils/appcolors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../auth/auth.dart';
import 'about_trello.dart';

import 'package:provider/src/provider.dart' as pro;

class SettingScrren extends StatefulWidget {
  const SettingScrren({super.key});

  @override
  State<SettingScrren> createState() => _SettingScrrenState();
}

class _SettingScrrenState extends State<SettingScrren> {
  int _value = 1;
  double h = 30;
  double w = 40;
  double h2 = 30;
  @override
  bool is_check = false;
  bool is_you = false;
  bool is_last = false;
  bool is_reset = false;

  Widget build(BuildContext context) {
    String abc;
    var mp = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.scaffoldbgcolor,
        leading: Icon(Icons.arrow_back),
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textw(
                text: "Notification",
              ),
              SizedBox(
                height: h,
              ),
              textw(
                text: "Open system settings",
              ),
              Divider(),
              SizedBox(
                height: h,
              ),
              textw(
                text: "Application theme",
              ),
              SizedBox(
                height: h,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: AlertDialog(
                            content: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(children: [
                                    Radio(
                                        value: 1,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Light"),
                                  ]),
                                  Row(children: [
                                    Radio(
                                        value: 2,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Dark"),
                                  ]),
                                  Row(children: [
                                    Radio(
                                        value: 3,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Follow system (defaul)"),
                                  ]),
                                ],
                              );
                            }),
                            title: Text(
                              "Select theme",
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'))
                            ],
                          ),
                        );
                      });
                },
                child: textw(
                  text: "Select theme",
                ),
              ),
              Divider(),
              SizedBox(
                height: h,
              ),
              textw(
                text: "Accessibility",
              ),
              SizedBox(
                height: h,
              ),
              ////////////// Row of text and check box

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowCheckBox(
                    text1: "Color blind friendly mode",
                  ),
                  Checkbox(
                      value: is_check,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        setState(() {
                          is_check = val!;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowCheckBox(
                    text1: "Enable animations",
                  ),
                  Checkbox(
                      value: is_you,
                      activeColor: Colors.green,
                      onChanged: (v) {
                        setState(() {
                          is_you = v!;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowCheckBox(
                    text1: "Show label names on card",
                  ),
                  Checkbox(
                      value: is_last,
                      activeColor: Colors.green,
                      onChanged: (i) {
                        setState(() {
                          is_last = i!;
                        });
                      }),
                ],
              ),

              Divider(),
              textw(text: "Sync"),
              SizedBox(
                height: h2,
              ),
              textw(text: "Sync queue"),
              Divider(),
              SizedBox(
                height: h2,
              ),
              textw(text: "General"),
              SizedBox(
                height: h2,
              ),
              InkWell(
                  onTap: () => launch(
                      'https://trello.com/login?returnUrl=%2Fmy%2Fprofile'),
                  child: textw(text: "Profile and visibility")),
              SizedBox(
                height: h2,
              ),
              textw(text: "Creat Card defaults"),
              SizedBox(
                height: h2,
              ),
              //////////////////////////////////////////////////////// langauge popumenu

              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: AlertDialog(
                            content: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(children: [
                                    Radio(
                                        value: 4,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Deutsch"),
                                  ]),
                                  //////////////////////////////////////////////////////// English

                                  Row(children: [
                                    Radio(
                                        value: 5,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("English"),
                                  ]),
                                  //////////////////////////////////////////////////////// Noderlands
                                  Row(children: [
                                    Radio(
                                        value: 6,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Noderlands"),
                                  ]),
                                  //////////////////////////////////////////////////////// Tieng
                                  Row(children: [
                                    Radio(
                                        value: 7,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Tiếng Việt"),
                                  ]),
                                  //////////////////////////////////////////////////////// turkce
                                  Row(children: [
                                    Radio(
                                        value: 8,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("Türkçe"),
                                  ]),
                                  //////////////////////////////////////////////////////// espano
                                  Row(children: [
                                    Radio(
                                        value: 9,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("españo"),
                                  ]),
                                  Divider()
                                ],
                              );
                            }),
                            title: Text(
                              "Set app language",
                            ),
                            actions: [
                              Container(
                                margin: EdgeInsets.only(right: 45),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('REASET TO DEFAULT')),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('CANCEL'))
                            ],
                          ),
                        );
                      });
                },
                child: textw(
                  text: "Set up langauge",
                ),
              ),
              SizedBox(
                height: h2,
              ),
              textw(text: "Delete account"),
              SizedBox(
                height: h2,
              ),
              //////////////////////////////////////////////////////// About trello
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: AlertDialog(
                            content: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  about_trello_app(
                                      image: 'assets/images/playstore.png',
                                      name: "Rate us on the Play Store",
                                      onTap: () => launch(
                                          'https://play.google.com/store/apps/details?id=com.trello')),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  about_trello_app(
                                      image: 'assets/images/twitter.png',
                                      name: "Trello on Twitter",
                                      onTap: () =>
                                          launch('https://twitter.com/trello')),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  about_trello_app(
                                      image: 'assets/images/facebook.png',
                                      name: "Trello on facebook",
                                      onTap: () => launch(
                                          'https://m.facebook.com/trelloapp?wtsid=rdr_0aFUlMf6eMjsHBr2f')),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  about_trello_app(
                                      image: 'assets/images/lock.png',
                                      name: "Pricavy",
                                      onTap: () => launch(
                                          'https://www.atlassian.com/legal/privacy-policy')),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  about_trello_app(
                                      image: 'assets/images/notepad.png',
                                      name: "Terms of service",
                                      onTap: () => launch(
                                          'https://www.atlassian.com/legal/cloud-terms-of-service')),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Trello for Android 2023.8.3.5802-2568789",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 89, 4, 104),
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Image.asset(
                                    'assets/images/dog.jpeg',
                                    scale: 1,
                                  )
                                ],
                              );
                            }),
                          ),
                        );
                      });
                },
                child: textw(
                  text: "About Trello",
                ),
              ),
              SizedBox(
                height: h2,
              ),
              InkWell(
                  onTap: () {
                    bottomSheet(context);
                  },
                  child: textw(text: "More Atlasian apps")),
              SizedBox(
                height: h2,
              ),
              InkWell(
                  onTap: () => launch("https://trello.com/contact#/"),
                  child: textw(text: "Contact support")),
              SizedBox(height: h2),
              InkWell(
                  onTap: (){
                    final provider=pro.Provider.of<GoogleSignInProvider>(context,listen:false);
                    provider.logout();
                    Navigator.pop(context);
                  },
                  child: textw(text: "Log out")),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColor.scaffoldbgcolor,
        context: context,
        builder: (context) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DISCOVER MORE",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      bottom_Sheet(
                        image: 'images/jira.png',
                        text3: "Jira Cloud",
                        text4: "Project and issue tracking",
                        onPressed: () => launch(
                            'https://play.google.com/store/apps/details?id=com.atlassian.android.jira.core'),
                      ),
                      Divider(
                        indent: 50,
                      ),
                      bottom_Sheet(
                        image: 'images/conn.png',
                        text3: "Confluence Cloud",
                        text4: "Collaborate on the go",
                        onPressed: () => launch(
                            'https://play.google.com/store/apps/details?id=com.atlassian.android.confluence.core'),
                      ),
                      Divider(
                        indent: 50,
                      ),
                      bottom_Sheet(
                        image: 'images/jira.png',
                        text3: "Jira Server",
                        text4: "Project and issue tracking",
                        onPressed: () => launch(
                            'https://play.google.com/store/apps/details?id=com.atlassian.jira.server'),
                      ),
                      Divider(
                        indent: 50,
                      ),
                      bottom_Sheet(
                        image: 'images/conf.png',
                        text3: "Confluence Server",
                        text4: "Confluence on the go",
                        onPressed: () => launch(
                            'https://play.google.com/store/apps/details?id=com.atlassian.confluence.server'),
                      ),
                      Divider(
                        indent: 50,
                      ),
                      bottom_Sheet(
                        image: 'images/conf.png',
                        text3: "Opsgenie",
                        text4: "Modern incident management",
                        onPressed: () => launch(
                            'https://play.google.com/store/apps/details?id=com.ifountain.opsgenie'),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class textw extends StatelessWidget {
  final String text;
  textw({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 60,
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
class bottom_Sheet extends StatelessWidget {
  final image;
  final String text3;
  final String text4;
  void Function()? onPressed;
  bottom_Sheet(
      {super.key,
      required this.image,
      required this.text3,
      required this.text4,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                scale: 15,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text3,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    text4,
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
              width: 50,
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    "GET",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 22, 179),
                    ),
                  ))),
        ],
      ),
    );
  }
}
