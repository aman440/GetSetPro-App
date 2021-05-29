//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:taskify/views/register.dart';
import 'package:taskify/views/splash.dart';
import '../views/login.dart';
import '../views/register.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      //TODO: defineIdOfRoutes

      '/': (context) => splash(),
      '/second': (context) => Login(),
      '/third': (context) => Register(),
    },
  ));
}
