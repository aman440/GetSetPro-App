import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../../widgets/action.dart';
import 'home.dart';

class SpaceSplashPage extends StatefulWidget {
  static String id = 'splashSpacePage';
  @override
  _SpaceSplashPageState createState() => _SpaceSplashPageState();
}

class _SpaceSplashPageState extends State<SpaceSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade900,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/images/bg.jpg').image,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(1), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            RiveAnimation.asset(
              'assets/rive/309-599-yoshis-island-1.riv',
              fit: BoxFit.cover,
            ),
            AnimationBackground(),
            OverlayMessage(),
          ],
        ),
      ),
    );
  }
}

class OverlayMessage extends StatefulWidget {
  @override
  _OverlayMessageState createState() => _OverlayMessageState();
}

class _OverlayMessageState extends State<OverlayMessage> {
  bool showProgressLoader = true;

  Future<void> navigate() async {
    return Future.delayed(Duration(milliseconds: 1000), () async {
      setState(() {
        showProgressLoader = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context) => navigate();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Spacer(),
                Text('Loading your space',
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6)),
                Spacer(),
                showProgressLoader
                    ? CircularProgressIndicator(
                        color: Colors.pink.shade100,
                      )
                    : ActionButton(
                        onTap: () {
                          Navigator.popAndPushNamed(context, SpaceHomePage.id);
                        },
                        iconData: CupertinoIcons.right_chevron),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimationBackground extends StatefulWidget {
  @override
  _AnimationBackgroundState createState() => _AnimationBackgroundState();
}

class _AnimationBackgroundState extends State<AnimationBackground> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
