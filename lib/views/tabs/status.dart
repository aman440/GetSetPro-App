import 'package:flutter/material.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, bottom: 100, right: 20),
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
      ),
    );
  }
}
