import 'package:flutter/material.dart';
import 'package:jobposting_app/Custom_Widgets/custom_button.dart';
import 'package:jobposting_app/Custom_Widgets/custom_textfield.dart';
import 'package:jobposting_app/Screens/Joblisting_Screen.dart';
import 'package:jobposting_app/Screens/Register_Screen.dart';

class Login_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xFF191720),
      body: Padding(
        padding: const EdgeInsets.only(top:110,left: 27,bottom: 59,right: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Let’s sign you in",
               style: TextStyle(color: Colors.white,
                   fontSize: 35,
                   fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            const Text("Welcome back\nyou’ve been missed !",
                style: const TextStyle(color: Colors.white,fontSize: 30)),
            const SizedBox(height: 47),
            custom_textfield(placeholder_text: "Enter your email address",pre_icon: const Icon(Icons.email_rounded)),
            custom_textfield(placeholder_text: "Enter your password",pre_icon:const Icon(Icons.lock_rounded),su_icon:const Icon(Icons.visibility)),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Register_Screen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account ?   ",
                    style: TextStyle(color: const Color(0xFF8F8F9E), fontSize: 15),
                  ),
                  GestureDetector(
                    onTap:()=>onregister(context),
                    child: const Text("Register",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 11),

            custom_button(label: "Sign In",onPress: ()=> onloginpress(context))
          ],
        ),
      ),
    );
  }
  onloginpress(BuildContext context) {
   Navigator.of(context)
       .push(MaterialPageRoute(builder: (_) => Joblisting_Screen()));
 }

  onregister(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Register_Screen()));
  }
}

