import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
//import 'package:todoey_flutter/models/task_data.dart';
import 'package:taskify/task_list/models/task_data.dart';
import 'package:taskify/task_list/models/task.dart';
import 'package:taskify/task_list/widgets/inputTextFields.dart';
import 'package:taskify/task_list/widgets/submitBtn.dart';
import 'package:taskify/views/home.dart';

import '../../updateProfile.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    TextEditingController _taskAddController = TextEditingController();

    @override
    void dispose() {
      _taskAddController.dispose();
      super.dispose();
    }

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20.0),
          //   topRight: Radius.circular(20.0),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 30.0,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InputTextField(
                // validator: (value) => Validator.validateName(
                //       name: value,
                //     ),
                color: Color(0xffF2F7FC),
                isPasswordField: false,
                textEditingController: _taskAddController),
            SizedBox(
              height: 50,
            ),
            SubmitButton(
                text: 'Add',
                onTap: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(_taskAddController.text);
                  _taskAddController.clear();
                  Navigator.popAndPushNamed(context, HomePage.id);
                })
          ],
        ),
      ),
    );
  }
}
