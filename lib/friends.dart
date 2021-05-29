import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


class CopiableContacts extends StatelessWidget {
  String content;

  CopiableContacts({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: RichText(
            text: TextSpan(text: content, style: GoogleFonts.montserrat(
                textStyle:
                TextStyle(color: Colors.blueGrey[400], fontWeight: FontWeight.w400))),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 50),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(
              CupertinoIcons.doc_on_doc,
              size: 18,
            ),
            onPressed: () {
              print('tapped');
              FlutterClipboard.copy(content).then((value) => {
                Fluttertoast.showToast(
                    msg: "Copied!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 12.0)
              });
            },
          ),
        ),
      ],
    );
  }
}






class InformationTile extends StatelessWidget {
  String title;
  bool isExpanded = false;
  Widget content;
  InformationTile(
      {required this.content, required this.title, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
        initiallyExpanded: isExpanded,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: ClayContainer(
                spread: 0,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Text(title)),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: Icon(CupertinoIcons.arrow_right, size: 20),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ));
        },
        content: Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          padding: EdgeInsets.all(20),
          child: content,
        ));
  }
}