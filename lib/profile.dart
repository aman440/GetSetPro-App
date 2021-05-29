import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'friends.dart';

import 'imageUpload.dart'; //for clayContainerHighlight
import 'updateProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(top: 60),
                    color: Color(0xFF8D58F0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClayContainerHighlight(
                          isSpreadAllowed: true,
                          iconData: CupertinoIcons.pencil,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    ProfilePage(),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        Spacer(),
                        Text(
                          'My Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 32.0,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.square_arrow_right,
                          color: Colors.white,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Container(
                      color: Color(0xffE5E5EE),
                      padding: EdgeInsets.only(top: 30, left: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'About Me',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'I am student of IIIT Kalyani',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InformationTile(
                              content: Column(
                                children: [
                                  CopiableContacts(
                                      content: 'Aman Pratap Singh'),
                                  CopiableContacts(content: 'Vedant Gupta'),
                                  CopiableContacts(content: 'Gaurav Anand'),
                                ],
                              ),
                              title: 'Friends',
                              isExpanded: true),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 290,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF7534C4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/dp.jfif'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Purnendu Vashistha',
                        style: TextStyle(
                            color: Color(0xFFB28DDE),
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.mail,
                              color: Colors.white70, size: 20),
                          Text(
                            '487_bt19@iiitkalyani.ac.in',
                            style: TextStyle(
                                color: Color(0xFFB28DDE),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            CupertinoIcons.phone,
                            color: Colors.white70,
                            size: 20,
                          ),
                          Text(
                            '+91-9472101347',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFB28DDE),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
