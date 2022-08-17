import 'dart:ui';

import 'package:flutter/material.dart';
class custom_listtile extends StatelessWidget {
  final String title,desc;
  final IconData icon1,icon2;
  final GestureTapCallback on_icon1_press,on_icon2_press;

  const custom_listtile({required this.title,required this.desc,required this.icon1,required this.icon2,required this.on_icon1_press,required this.on_icon2_press});
  @override
  Widget build(BuildContext context) {
    return Card(
      color:  const Color(0xFF201E27),
      margin: const EdgeInsets.all(11),
      elevation: 10,
      child:ListTile(
      contentPadding: const EdgeInsets.all(15),
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.white
          )),
      subtitle: Text(desc,
      style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white
      )),
      trailing: Wrap(
        spacing: 30, // space between two icons
        children: <Widget>[
          GestureDetector(
            child:Icon(icon1,size: 18.48,color: Colors.white), // icon-1
          onTap: on_icon1_press,
          ),
          GestureDetector(child:
          Icon(icon2,size: 19.5,color: Colors.red), // icon-2//
            onTap: on_icon2_press,
             ),
        ],
      ),
      )
    );
  }
}