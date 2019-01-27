import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final DateTime selected;

  CalendarPage([this.selected]);

  @override
  State<StatefulWidget> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _currentDate = widget.selected ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: CalendarCarousel(

              weekendTextStyle: TextStyle(
                color: Colors.red,
              ),
              locale: "es",
              thisMonthDayBorderColor: Colors.grey,
              daysTextStyle: TextStyle(color: Colors.black),
              weekFormat: false,
              /* height: 420.0, */
              selectedDateTime: _currentDate,
              daysHaveCircularBorder: true,
              customGridViewPhysics: NeverScrollableScrollPhysics(),
            ),
          )),
    );
  }
}