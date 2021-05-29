import 'package:flutter/material.dart';
import 'package:taskify/vedant_task/slidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AppContainer(),
      ),
    );
  }
}
