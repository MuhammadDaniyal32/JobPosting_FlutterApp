import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jobposting_app/Screens/Joblisting_Screen.dart';
import 'package:jobposting_app/Screens/Login_Screen.dart';

import '../Custom_Widgets/custom_button.dart';
import '../Custom_Widgets/custom_textfield.dart';

class Register_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset : false,
    backgroundColor: const Color(0xFF191720),
    body: Padding(
      padding:
      const EdgeInsets.only(top:110,left: 27,bottom: 59,right: 27),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const Text("Let's sign you up",
          style: TextStyle(color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        const Text("Welcome\nJoin the community!",
        style: TextStyle(color: Colors.white,fontSize: 30)),
         const SizedBox(height: 47),
        const custom_textfield(placeholder_text: "Enter your full name",pre_icon:Icon(Icons.person)),
        const custom_textfield(placeholder_text: "Enter your email address",pre_icon: Icon(Icons.email_rounded)),
        const custom_textfield(placeholder_text: "Enter your password",pre_icon:Icon(Icons.lock_rounded),su_icon:const Icon(Icons.visibility)),
        const Spacer(),
        GestureDetector(
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Login_Screen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account ? ",
              style: TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
              ),

              GestureDetector(
                onTap:()=>onsignin_press(context),
                child: const Text("Sign In",
                style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 11),
        custom_button(label: "Sign Up",onPress:()=>onsignup_press(context),)

      ],
    ) ,
    ),
  );
  }

  void onsignup_press(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Joblisting_Screen()));
  }

  void onsignin_press(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Login_Screen()));
  }
}
