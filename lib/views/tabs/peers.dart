import 'package:flutter/material.dart';

class PeersTab extends StatefulWidget {
  @override
  _PeersTabState createState() => _PeersTabState();
}

class _PeersTabState extends State<PeersTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, bottom: 100, right: 20),
      child: Container(
        height: 200,
        width: 200,
        color: Colors.pink,
      ),
    );
  }
}
