import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'taskify',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  // Within the `FirstScreen` widget
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/second');
                  },
                  child: Text('Continue To Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
