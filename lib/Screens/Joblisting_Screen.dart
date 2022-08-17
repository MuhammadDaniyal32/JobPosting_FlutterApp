import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jobposting_app/Custom_Widgets/custom_listtile.dart';
import 'package:jobposting_app/Screens/Addjob_Screen.dart';
import 'package:jobposting_app/Screens/Editjob_Screen.dart';
import 'package:jobposting_app/Screens/Login_Screen.dart';
import '../Models/JobPost_Model.dart';

class Joblisting_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Joblisting_Screen();
}

class _Joblisting_Screen extends  State<Joblisting_Screen> {
List <JobPost_Model> items =[];
String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xFF191720),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onaddjob(context);
        },
        backgroundColor: const Color(0xFFE5E5E5),
        child: const Icon(Icons.add,color: Color(0xFF191720)),
      ),
      body: Container(
        padding: const EdgeInsets.only(top:79,left: 27),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Welcome",
                    style:TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 248),

              GestureDetector(child:const Icon(Icons.logout,color: Colors.white),
              onTap:()=>onlogout_press(context),)
              ]),
            Column(
              children: [
            Row(
              children: const [
                Text("Muhammad Daniyal",
                    style:TextStyle(color: Colors.white,
                        fontSize: 25)),

              ],),
                Container(
                  margin: const EdgeInsets.only(top: 20,right: 27),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF1E1C24),
                      border: Border.all(color: const Color(0xff5D5D67), width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    onChanged:ontextchange,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIconColor: Colors.white,
                        hintText: "Search keywords...",
                        hintStyle: TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                        border: InputBorder.none),
                     )
                  ),

                Container(
                  height: 530,
                  padding: const EdgeInsets.only(right: 27),
                  child: Expanded(
                    child: items.isNotEmpty ?
                    ListView.builder(
                      itemBuilder: (context, index) => custom_listtile(title: items[index].job_title,desc: items[index].job_desc,icon1:Icons.edit_outlined,icon2:Icons.delete_outline,on_icon1_press:()=>onedit(context,index,JobPost_Model(items[index].job_title,items[index].job_desc)) ,on_icon2_press:()=>ondelete(context,index)),
                      itemCount: items.length,
                    ): const Center(
                      child: Text('No Jobs available!',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],),
          ],
        ),
      ),
    );
  }

  void ondelete(BuildContext context, int index) {
    showAlertDialog(context,index);
  }

  void onedit(BuildContext context,int index,JobPost_Model jobPost_Model) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Editjob_Screen(JobPost:jobPost_Model)))
        .then((value) => setState((){
          value as JobPost_Model;
            if(value.job_title!=""&&value.job_desc!=""){
              items[index].job_title=value.job_title;
              items[index].job_desc=value.job_desc;
            }
    }));

  }

  void onaddjob(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Addjob_Screen()))
    .then((value) =>  setState(() {
      value as JobPost_Model;
      if(value.job_title!=""&&value.job_desc!="")
        {
          items.add(JobPost_Model(value.job_title,value.job_desc));
        }
    }));
  }

  void onlogout_press(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Login_Screen()));
  }

    void ontextchange(String query) {
        final item = items.where((book) {
          final titleLower = book.job_title.toLowerCase();
          final descLower = book.job_desc.toLowerCase();
          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower) ||
              descLower.contains(searchLower);
        }).toList();

        setState(() {
          if(item.isNotEmpty) {
          this.query = query;
            items = item;
          }
        });
    }

      showAlertDialog(BuildContext context, int index) {
        // set up the buttons
        Widget cancelButton = TextButton(
          child: const Text("Cancel",style: TextStyle(color: Colors.white)),
          onPressed:  () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
        Widget continueButton = TextButton(
          child: const Text("Remove",style: TextStyle(color: Colors.red)),
          onPressed:  () {
            setState(() {
              items.removeAt(index);
              Navigator.of(context, rootNavigator: true).pop();
            });
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          backgroundColor:  const Color(0xFF201E27),
          title: const Text("Remove Job",style: TextStyle(color: Colors.white)),
          content: Text("Do You Want To Remove ${items[index].job_title} Job?",style: const TextStyle(color: Colors.white)),
          actions: [
            cancelButton,
            continueButton
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
}
