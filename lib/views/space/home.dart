import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:taskify/views/space/search.dart';
import 'package:taskify/widgets/action.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SpaceHomePage extends StatefulWidget {
  static String id = 'homeSpacePage';
  @override
  _SpaceHomePageState createState() => _SpaceHomePageState();
}

class _SpaceHomePageState extends State<SpaceHomePage> {
  late CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  final showProgressLoader = false;
  DateTime _currentDate = DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );

  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    showCalender();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('assets/images/bg.jpg').image,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, Gaurav!',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    Spacer(),
                    ActionButton(
                        iconData: CupertinoIcons.search,
                        onTap: () async {
                          showSearch(
                              context: context, delegate: FriendSearch());
                        })
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      FlutterLogo(
                        size: 300,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 40),
                        height: 100,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.hardEdge,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Leading",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("     Kunal Roy")
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                  showProgressLoader
                                      ? CircularProgressIndicator(
                                          color: Colors.pink.shade100,
                                        )
                                      : ActionButton(
                                          onTap: () {
                                            Navigator.popAndPushNamed(
                                                context, SpaceHomePage.id);
                                          },
                                          iconData:
                                              CupertinoIcons.right_chevron),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                showCalender()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showCalender() {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      daysTextStyle: TextStyle(color: Colors.white),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        print(_currentDate);
      },
      showHeader: false,
      weekendTextStyle: TextStyle(
        color: Colors.red[300],
      ),
      thisMonthDayBorderColor: Colors.transparent,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      prevDaysTextStyle: TextStyle(color: Colors.blueGrey.shade400),
      height: 280.0,
      selectedDateTime: _currentDate,
      showWeekDays: false,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _currentDate = date;
          _currentMonth = DateFormat.yMMM().format(_currentDate);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.0),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 30.0,
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          ' May ${_currentDate.day.toString()}, 2021',
                          // _currentMonth,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.white70),
                        )),
                        TextButton(
                          child: NeumorphicIcon(
                            CupertinoIcons.arrow_left,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: NeumorphicIcon(CupertinoIcons.arrow_right,
                              size: 30),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: _calendarCarouselNoHeader,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  final riveFileName = 'assets/truck.riv';
  late Artboard _artboard;

  // @override
  // void initState() {
  //   _loadRiveFile();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? Rive(
            artboard: _artboard,
            fit: BoxFit.cover,
          )
        : Container();
  }

  // loads a Rive file
  // void _loadRiveFile() async {
  //   final bytes = await rootBundle.load(riveFileName);
  //   final file = Rive();

  //   if (file.import(bytes)) {
  //     // Select an animation by its name
  //     setState(() => _artboard = file.mainArtboard
  //       ..addController(
  //         SimpleAnimation('idle'),
  //       ));
  //   }

  // }
}
