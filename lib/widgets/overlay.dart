import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:taskify/constants.dart';

class OverlayDisplay extends StatefulWidget {
  // Alignment alignment = Alignment.center;
  // double height = 200;
  String gif = '';
  String child = '';
  // double width = 200;
  String title = '';
  String name = '';
  OverlayDisplay(
      {required this.gif,
      required this.name,
      required this.title,
      required this.child});
  @override
  _OverlayDisplayState createState() => _OverlayDisplayState();
}

class _OverlayDisplayState extends State<OverlayDisplay> {
  bool isLiked = false;
  bool isFlagged = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          InkWell(
            onDoubleTap: () {
              print('tapped');
              setState(() {
                isLiked = !isLiked;
              });
            },
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: RiveAnimation.asset(
                      'assets/rive/${widget.child}',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.name,
                                style: kHeading4.copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Image.asset(
                                'assets/images/${widget.gif}',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey)),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'Say congratulations or join.',
                        overflow: TextOverflow.ellipsis,
                        style: kHeading4,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFlagged = !isFlagged;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade50,
                    radius: 20,
                    child: Icon(
                      !isFlagged
                          ? CupertinoIcons.bookmark
                          : CupertinoIcons.bookmark_fill,
                      color: isFlagged ? Colors.orange : Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade50,
                    radius: 20,
                    child: Icon(
                      !isLiked
                          ? CupertinoIcons.heart
                          : CupertinoIcons.heart_fill,
                      color: isLiked ? Colors.red : Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
