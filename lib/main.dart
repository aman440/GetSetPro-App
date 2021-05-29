import 'package:flutter/material.dart';
import 'package:taskify/task_list/models/task_data.dart';
import 'package:taskify/vedant_task/slidebar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <TaskData>(

    create: (context) => TaskData(),
      child: MaterialApp(
        home: Scaffold(
          body: AppContainer(),
        ),
      ),
    );
  }
}
