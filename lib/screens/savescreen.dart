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
  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {

    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,

    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
    print({selectedTime.hour} );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(

          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'description'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text("Choose Time"),
            ),

            GestureDetector(
              child: Text("save"),
              onTap: () {
                context.read<ActivityBloc>().add(AddActivityEvent(
                    titleController.text, descriptionController.text,
                    Duration(hours: selectedTime.hour, minutes: selectedTime.minute)));
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }





}



