import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
 final String placeholder_text;
 final Icon pre_icon,su_icon;

  const custom_textfield({required this.placeholder_text,  this.pre_icon=const Icon(null), this.su_icon=const Icon(null)}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: const Color(0xFF1E1C24),
    border: Border.all(color: const Color(0xff5D5D67), width: 1),
    borderRadius: BorderRadius.circular(15)),
    child: TextField(
    style: const TextStyle(color: Colors.white, fontSize: 15),
    decoration: InputDecoration(
        prefixIcon: pre_icon,
    suffixIcon:su_icon,
    suffixIconColor: Colors.white,
    hintText: placeholder_text,
    hintStyle: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
    border: InputBorder.none),
    )
    );
  }
}
