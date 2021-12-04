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
            GestureDetector(
              child: Text("save"),
              onTap: () {
                context.read<ActivityBloc>().add(AddActivityEvent(
                    titleController.text, descriptionController.text));
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
