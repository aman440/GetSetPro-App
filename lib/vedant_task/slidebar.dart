import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/constants.dart';
import 'package:taskify/task_list/models/task_data.dart';
import 'package:taskify/task_list/screens/add_task_screen.dart';
import 'package:taskify/task_list/screens/tasks_screen.dart';
import 'page.dart';

class AppContainer extends StatefulWidget {
  static String id = 'slideBar';
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<Paaage> menu = [
    Paaage(iconName: Icons.home, name: 'Home'),
    Paaage(iconName: Icons.add, name: 'Add New Post'),
    Paaage(iconName: Icons.settings, name: 'Setting'),
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

  // void setPageContent() {
  //   content = menu[selectedMenuItem].content1;
  // }

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> contents = [
    Column(children: [
      Container(
        color: Color(0xff5ac18e),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => print('hi'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Task',
                          style: kHeading1.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(child: Image.asset('assets/images/cup.gif'))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Rank',
                          style: kHeading1.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(child: Image.asset('assets/images/confetti.gif'))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(padding: EdgeInsets.only(top: 0), child: TasksScreen()),
    ]),
    AddTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset('assets/images/bg.jpg').image,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
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
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  print(selectedMenuItem);
                                  sidebarOpen = false;
                                  setState(() {
                                    selectedMenuItem = index;
                                  });
                                  setSidebarState();
                                  // setPageContent();
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
            height: double.infinity,
            width: double.infinity,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(xOffset, yOffset, 1.0)
              ..scale(pageScale),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: sidebarOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(0)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 15),
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
                  menu[selectedMenuItem].iconName == Icons.add
                      ? contents[1]
                      : contents[0],
                ],
              ),
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
