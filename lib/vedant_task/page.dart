import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paaage {
  final String name;
  final IconData iconName;
  final Container content1 = Container(
    color: Colors.pink,
    width: 200,
    height: 200,
    child: Column(children: [
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => print('hi'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Task',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => print('hi'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Rank',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ]),
  );
  Paaage({required this.name, required this.iconName});
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      width: 200,
      height: 200,
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => print('hi'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Task',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => print('hi'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Rank',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
