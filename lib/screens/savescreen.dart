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

  final TextEditingController Hourscontroller = TextEditingController();
  final TextEditingController Minutecontroller = TextEditingController();

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
                    offset: Offset(3.0, 3.0),
                  )
                ],
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: 'description',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: Hourscontroller,
                  decoration: InputDecoration(
                      hintText: 'Enter hours',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: Minutecontroller,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      hintText: 'Enter Minutes',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.grey),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "save",
                            style: TextStyle(color: Colors.white),
                          ))),
                  onTap: () {
                    int min = int.parse(Minutecontroller.text);

                    if (min < 60 && min >= 0) {
                      context.read<ActivityBloc>().add(AddActivityEvent(
                          titleController.text,
                          descriptionController.text,
                          Duration(
                              hours: int.parse(Hourscontroller.text),
                              minutes: min)));
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Container(
                        child: Text("Enter a valid duration"),
                      )));
                    }
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
