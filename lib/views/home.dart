import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/models/tabs.dart';
import 'package:taskify/views/space/splash.dart';
import 'package:taskify/views/splash.dart';
import 'package:taskify/widgets/fab.dart';

class HomePage extends StatefulWidget {
  static String id = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Provider.of<TabViews>(context).getTabView(context)),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Provider.of<TabViews>(context, listen: false)
                    .showBottomNavigationBar
                ? Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        BottomNavigationTabs(
                          index: 0,
                          iconData: CupertinoIcons.house_alt,
                        ),
                        BottomNavigationTabs(
                          index: 1,
                          iconData: CupertinoIcons.square_favorites_alt,
                        ),
                        Expanded(child: Container()),
                        BottomNavigationTabs(
                          index: 2,
                          iconData: CupertinoIcons.graph_circle,
                        ),
                        BottomNavigationTabs(
                          index: 3,
                          iconData: CupertinoIcons.person,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SpaceSplashPage.id);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.blue.shade50,
                  radius: 25,
                  child: Image.asset('assets/images/island.gif'),
                ),
              ))
        ],
      )),
    );
  }
}

class BottomNavigationTabs extends StatefulWidget {
  int index;
  IconData iconData;
  BottomNavigationTabs({Key? key, required this.index, required this.iconData})
      : super(key: key);

  @override
  _BottomNavigationTabsState createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Provider.of<TabViews>(context, listen: false)
              .setTabView(widget.index);
          print(Provider.of<TabViews>(context, listen: false).selectedIndex);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Icon(
            widget.iconData,
            color:
                Provider.of<TabViews>(context, listen: false).selectedIndex ==
                        widget.index
                    ? Colors.green
                    : Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
