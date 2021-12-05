import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/screens/activity/bloc/activity_bloc.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);


  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

final TextEditingController Hourscontroller=TextEditingController();
  final TextEditingController Minutecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("text"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(3.0, 3.0), // shadow direction: bottom right
                  )
                ],
                color: Colors.black87,  borderRadius: BorderRadius.all(Radius.circular(20))),
            padding: EdgeInsets.all(20),

            child: Column(

              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: 'Title',hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: 'description',hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: Hourscontroller,
                  decoration: InputDecoration(hintText: 'Enter hours',hintStyle: TextStyle(color: Colors.white)),

                ),
                SizedBox(height: 20,),
                TextField(
                  controller: Minutecontroller,
                  decoration: InputDecoration(hintText: 'Enter Minutes',hintStyle: TextStyle(color: Colors.white)),
                ),


                SizedBox(height: 50,),

                GestureDetector(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Text("save",style:TextStyle(color: Colors.white) ,))),
                  onTap: () {
                    context.read<ActivityBloc>().add(AddActivityEvent(
                        titleController.text, descriptionController.text,
                        Duration(hours: int.parse(Hourscontroller.text), minutes:int.parse(Minutecontroller.text))));
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }





}



