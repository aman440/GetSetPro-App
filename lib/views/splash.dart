import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:taskify/views/home.dart';

import 'login.dart';

class SplashPage extends StatefulWidget {
  static String id = 'splashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // final riveFileName = 'assets/truck.riv';
  // late Artboard _artboard;
  Future<void> navigate() async {
    final _user = FirebaseAuth.instance.currentUser;
    return Future.delayed(Duration(milliseconds: 1000), () async {
      if (_user == null)
        Navigator.popAndPushNamed(context, LoginPage.id);
      else {
        Navigator.popAndPushNamed(context, HomePage.id);
      }
    });
  }

  @override
  void initState() {
    //  _loadRiveFile();
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  // void _loadRiveFile() async {
  //   final bytes = await rootBundle.load(riveFileName);
  //   final file = RiveFile();

  //   if (file.import(bytes)) {
  //     // Select an animation by its name
  //     setState(() => _artboard = file.mainArtboard
  //       ..addController(
  //         SimpleAnimation('idle'),
  //       ));
  //   }
  // }

  void afterFirstLayout(BuildContext context) => navigate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/bg.jpg').image,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'GetSetPro',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
