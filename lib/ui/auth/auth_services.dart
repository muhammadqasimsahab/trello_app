import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:images_pikcker/ui/Home/home_screen.dart';
import 'package:images_pikcker/ui/welcome%20page/welcome_screen.dart';


class AuthClass extends StatelessWidget {
  const AuthClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    body:  StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasData){
          return HomeScreen();
        }else if(snapshot.hasError){
          return const Center(child: Text('Error'));
        }else{
          return const WelcomeScreen();
        }
      },
    ),
  );
}
