import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<Paaage> menu = [
    Paaage(
      iconName: Icons.home,
      name: 'Home',
    ),
    Paaage(
      iconName: Icons.add,
      name: 'Add New Post',
    ),
    Paaage(
      iconName: Icons.settings,
      name: 'Setting',
    ),
  ];
  // final List<String> menuItems = ["Home", "Add New Post", "Settings"];
  // final List<IconData> menuIcons = [
  //   Icons.home,
  //   Icons.add,
  //   Icons.settings,
  // ];

  bool sidebarOpen = false;

  double yOffset = 0;
  double xOffset = 0;
  double pageScale = 1;

  int selectedMenuItem = 0;
  Container content = Container();

  String pageTitle = "Homepage";

  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? 265 : 0;
      yOffset = sidebarOpen ? 70 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  void setPageContent() {
    content = menu[selectedMenuItem].content1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0x665AC18E),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            sidebarOpen = true;
                            setSidebarState();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.search,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Container(
                            child: Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20),
                                hintText: "Search here...",
                                hintStyle: TextStyle(
                                  color: Color(0xFFB666666),
                                )),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                      child: new ListView.builder(
                          itemCount: menu.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  sidebarOpen = false;
                                  selectedMenuItem = index;
                                  setSidebarState();
                                  setPageContent();
                                },
                                child: MenuItem(
                                  itemIcon: menu[index].iconName,
                                  itemText: menu[index].name,
                                  selected: selectedMenuItem,
                                  position: index,
                                ),
                              ))),
                ),
                Container(
                  child: MenuItem(
                    itemIcon: Icons.logout,
                    itemText: "Logout",
                    selected: selectedMenuItem,
                    position: menu.length + 1,
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(xOffset, yOffset, 1.0)
              ..scale(pageScale),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: sidebarOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(0)),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          sidebarOpen = !sidebarOpen;
                          setSidebarState();
                        },
                        child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(20),
                            child: Icon(Icons.menu)),
                      ),
                    ],
                  ),
                ),
                Content(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String itemText;
  final IconData itemIcon;
  final int selected;
  final int position;
  MenuItem({
    required this.itemText,
    required this.itemIcon,
    required this.selected,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? Color(0xFF5AC18E) : null,
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Icon(
              itemIcon,
              color: Colors.teal,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemText,
              style: TextStyle(color: Colors.teal, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
