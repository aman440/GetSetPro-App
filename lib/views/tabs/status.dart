import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart' show DateFormat;

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  late CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  final showProgressLoader = false;
  DateTime _currentDate = DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, bottom: 100, right: 20),
      child: showCalender(),
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
    return Center(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('assets/images/bg.jpg').image,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
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
          )),
    );
  }
}
