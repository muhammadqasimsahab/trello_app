import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:images_pikcker/ui/Home/home_screen.dart';
import 'package:images_pikcker/ui/auth/auth.dart';
import 'package:images_pikcker/ui/auth/auth_services.dart';
import 'package:images_pikcker/ui/welcome%20page/welcome_screen.dart';
import 'package:images_pikcker/utils/string.dart';
import 'package:provider/provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

late Size mp;
final box=GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<GoogleSignInProvider>(
    create: (context)=> GoogleSignInProvider(),

    child:  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trello App",
      fallbackLocale: const Locale('en', 'US'),
      locale: const Locale('en', 'US'),
      translations: AppString(),
      home: const AuthClass(),
    ));

}
