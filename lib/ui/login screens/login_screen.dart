import 'package:flutter/material.dart';
import '../../utils/appbar.dart';
import '../../utils/appcolors.dart';
import '../../widgets/reusable_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mp = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.Homewcreenwidgetbordercolor2,
      appBar: setAppBar('Sign Up'),
      body: Center(
        child: Container(
          height: mp.height * 0.5,
          width: mp.width * 0.8,

          // color: AppColors.ContainerForLoginScreen,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, //New
                  blurRadius: 25.0,
                  offset: Offset(10, -10))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableTextFiled(
                  labelText: "Enter Name",
                ),
                const SizedBox(height: 20),
                ReusableTextFiled(labelText: "Enter Email"),
                const SizedBox(height: 30),
                SizedBox(
                  width: mp.width * 0.5,
                  height: mp.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.to(()=>signUpScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 15.0,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
