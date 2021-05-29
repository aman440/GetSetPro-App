import 'package:flutter/material.dart';

class DashboardTab extends StatefulWidget {
  @override
  _DashboardTabState createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, bottom: 100, right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 2,
        width: 200,
        color: Colors.red,
      ),
    );
  }
}
