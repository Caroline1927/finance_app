import 'package:finance_app/screens/change_transaction.dart';
import 'package:finance_app/constants.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'edit_screen.dart';

/// The hove page which hosts the calendar
class CalendarEdit extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const CalendarEdit({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarEditState createState() => _CalendarEditState();
}

class _CalendarEditState extends State<CalendarEdit> {
  final CalendarController _controller = CalendarController();
  String _text = '';

  void selectionChanged(CalendarSelectionDetails details) {
    if (_controller.view == CalendarView.month ||
        _controller.view == CalendarView.timelineMonth) {
      _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    } else {
      _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    }
    setState(() {
      dateTime = _text;
      dateTr = true;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditTransaction()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.purple,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SfCalendar(
            onSelectionChanged: selectionChanged,
            appointmentTextStyle: const TextStyle(color: Colors.orangeAccent),
            viewHeaderStyle: const ViewHeaderStyle(
                dateTextStyle: TextStyle(color: Colors.orangeAccent),
                dayTextStyle: TextStyle(
                  color: Colors.orangeAccent,
                ),
                backgroundColor: Colors.purple),
            viewNavigationMode: ViewNavigationMode.none,
            showCurrentTimeIndicator: false,
            allowViewNavigation: false,
            showDatePickerButton: true,
            maxDate: DateTime.now(),
            selectionDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.orangeAccent, width: 2),
              shape: BoxShape.rectangle,
            ),
            firstDayOfWeek: 1,
            todayTextStyle: const TextStyle(color: Colors.black),
            headerStyle: CalendarHeaderStyle(
              textStyle: headStyle,
              backgroundColor: Colors.purple,
            ),
            blackoutDatesTextStyle: const TextStyle(color: Colors.orangeAccent),
            headerHeight: 150,
            todayHighlightColor: Colors.orangeAccent,
            cellBorderColor: Colors.orangeAccent,
            view: CalendarView.month,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: IconButton(
            icon: closeIcon,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditTransaction()),
              );
            },
          ),
        ),
      ],
    ));
  }
}
