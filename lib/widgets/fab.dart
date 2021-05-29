import 'dart:io';
import 'dart:typed_data';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class ActionFab extends StatefulWidget {
  @override
  _ActionFabState createState() => _ActionFabState();
}

class _ActionFabState extends State<ActionFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  final ImagePicker picker = ImagePicker();

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  void showSnackBar(BuildContext context, String content, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: isError ? Colors.green : Colors.redAccent,
      content: Text(
        content,
        style: kHeading4.copyWith(color: Colors.white, letterSpacing: 0.5),
      ),
    ));
  }

  Widget toggle() {
    return Container(
      height: 80,
      width: 80,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 10,
          shape: PolygonBorder(
            // side: BorderSide(
            //     color: Colors.white,
            //     // width: ((_animateIcon.value * 10) % 5) + 2),
            sides: 6,
            borderRadius: 10.0, // Default 0.0 degrees
            rotate: _animateIcon.value * 90, // Default 0.0 degrees
          ),
          // backgroundColor: Color(0xff2F4858),
          clipBehavior: Clip.hardEdge,
          onPressed: animate,
          tooltip: 'Toggle',
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.green.shade800,
              Color(0xffF6FAFE),
            ], stops: [
              0.7,
              0.9
            ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
            child: Center(
              child: AnimatedIcon(
                size: 16 - ((_animateIcon.value * 5)),
                icon: AnimatedIcons.menu_close,
                progress: _animateIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return toggle();
  }
}
