//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:taskify/views/register.dart';
import 'package:taskify/views/splash.dart';
import '../views/login.dart';
import '../views/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => splash(),
      '/second': (context) => login(),
      '/third': (context) => register(),
    },
  ));
}
