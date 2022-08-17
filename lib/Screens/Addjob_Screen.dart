import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jobposting_app/Custom_Widgets/custom_button.dart';
import 'package:jobposting_app/Models/JobPost_Model.dart';
import 'Joblisting_Screen.dart';

class Addjob_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Addjob_Screen();
}

class _Addjob_Screen extends State<Addjob_Screen> {
  TextEditingController titleFieldCon = TextEditingController();
  TextEditingController descpFieldCon= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xFF191720),
      body: Padding(
        padding: const EdgeInsets.only(top:89,left: 27,right: 27),
        child: Column(
          children: [
            Row(
              children: [

                GestureDetector(
                  onTap:()=>onback_press(context),
                    child: const Icon(Icons.arrow_back_ios,color: Colors.white)),
                const SizedBox(width: 31),
                const Text("Add New Job",
                    style: TextStyle(color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600))
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 31),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFF1E1C24),
                    border: Border.all(color: const Color(0xff5D5D67), width: 1),
                    borderRadius: BorderRadius.circular(15)),

                child: TextField(
                  controller: titleFieldCon,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  decoration: const InputDecoration(
                      hintText:"Enter position name",
                      hintStyle: TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                      border: InputBorder.none),
                )
            ),
            Container(
                height: 374,
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFF1E1C24),
                    border: Border.all(color: const Color(0xff5D5D67), width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: descpFieldCon,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  decoration: const InputDecoration(
                      hintText:"Describe Requirement...",
                      hintStyle: TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                      border: InputBorder.none),
                )
            ),
            const Spacer(),
            custom_button(label: "Submit Job",onPress:()=>onsubmit_job(context),),
            const SizedBox(height: 59),
          ],
        ),
      ),
    );
  }

  void onsubmit_job(BuildContext context) {
    var data = JobPost_Model(titleFieldCon.text, descpFieldCon.text);
    Navigator.pop(context, data);
  }

  void onback_press(BuildContext context) {
    Navigator.pop(context);
  }
}
