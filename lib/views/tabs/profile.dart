import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/constants.dart';
import 'package:taskify/widgets/action.dart';

import '../../friends.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset('assets/images/bg.jpg').image,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Color(0xFF8D58F0).withOpacity(0.3),
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      ActionButton(
                        isSpreadAllowed: false,
                        iconData: CupertinoIcons.pencil,
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) => ProfilePage(),
                          //   ),
                          // );
                          // setState(() {});
                        },
                      ),
                      Spacer(),
                      Text(
                        'My Profile',
                        style: kHeading1.copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.square_arrow_right,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Container(
                    color: Color(0xffE5E5EE).withOpacity(0.3),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.18,
                        left: 20,
                        bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'About Me',
                          textAlign: TextAlign.left,
                          style: kHeading3.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'I am student of IIIT Kalyani',
                          textAlign: TextAlign.left,
                          style: kHeading4.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InformationTile(
                            content: Column(
                              children: [
                                CopiableContacts(content: 'Aman Pratap Singh'),
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
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                height: 290,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF7534C4).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.only(
                          top: 32, bottom: 32, left: 16, right: 16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/juggler.gif'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Purnendu Vashistha',
                            style: kHeading2.copyWith(
                                color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(CupertinoIcons.mail,
                                  color: Colors.white70, size: 20),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '487_bt19@iiitkalyani.ac.in',
                                style: kHeading3.copyWith(
                                    color: Colors.white70, fontSize: 16),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.phone,
                                color: Colors.white70,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '+91-9472101347',
                                textAlign: TextAlign.center,
                                style: kHeading3.copyWith(
                                    color: Colors.white70, fontSize: 16),
                              ),
                              Spacer(),
                            ],
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
    );
  }
}
