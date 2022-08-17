import 'package:flutter/material.dart';
import 'package:jobposting_app/Screens/Register_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register_Screen(),
    );
  }


}


