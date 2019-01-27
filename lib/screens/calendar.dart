import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final DateTime selected;

  CalendarPage([this.selected]);

  @override
  State<StatefulWidget> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();
  String _currentMonth = '';
  Color fillColor = Colors.transparent;
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.red,
        backgroundBlendMode:BlendMode.darken,
       // border: Border.all(color: Colors.red, width: 4.0)
    ),
    //child: new Icon(
      //Icons.person,
     // color: Colors.amber,
   // ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 1, 10): [
        new Event(
          date: new DateTime(2019, 1, 10),
          title: 'Event 1',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        new DateTime(2019, 1, 11),
        new Event(
          date: new DateTime(2019, 1, 12),
          title: 'Event 1',
          icon: _eventIcon,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              this.setState(() => _currentDate = date);
              events.forEach((event) => print(event.title));
            },
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
//          headerText: Container( /// Example for rendering custom header
//            child: Text('Custom Header'),
//          ),
//          markedDates: _markedDate,
            weekFormat: false,
            markedDatesMap: _markedDateMap,
            height: 420.0,
            selectedDateTime: _currentDate,
          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
            customGridViewPhysics: NeverScrollableScrollPhysics(),
            markedDateShowIcon: true,
            markedDateIconMaxShown: 4,
            todayTextStyle: TextStyle(
              color: Colors.blue,
            ),
            todayBorderColor: Colors.orange,
            markedDateMoreShowTotal:
                true, // null for not showing hidden events indicator

            markedDateIconBuilder: (event) {
              return event.icon;
            },
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
          ),
        ),
      ),
    );
  }
}
