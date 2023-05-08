import 'package:artist_finder/components/common/operationdata.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:artist_finder/models/Proposal.dart';
import 'dart:core';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectCalendarDate = DateTime.now();
  DateTime? _focusCalendarDate;
  bool selectCorrectDate = false;
  String location = 'Europe/Lisbon';

  Map<DateTime, List<Proposal>> events = {};
  void createmap() {
    for (Proposal prop in proposlist) {
      if (prop.isAccepted) {
        DateTime aux = DateTime.parse(prop.date);
        if (events.containsKey(aux)) {
          events[aux]?.add(prop);
        } else {
          events[aux] = [prop];
        }
      }
    }
    print(events);
  }

  DateTime parseToCorrectDate(DateTime date) {
    String datetostring = date.toString();
    String auxiliar = datetostring.substring(0, datetostring.length - 1);
    return DateTime.parse(auxiliar);
  }

  bool checkDate(DateTime date) {
    if (events.containsKey(parseToCorrectDate(date))) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    createmap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('A minha agenda'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          TableCalendar(
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            calendarStyle: const CalendarStyle(
                holidayDecoration: BoxDecoration(color: Colors.green)),
            holidayPredicate: (day) {
              return checkDate(day);
            },
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (currentSelectDate) {
              return (isSameDay(_selectCalendarDate, currentSelectDate));
            },
            onDaySelected: (selectedDay, focusedDay) {
              // as per the documentation
              if (!isSameDay(_selectCalendarDate, selectedDay)) {
                setState(() {
                  _selectCalendarDate = selectedDay;
                  _focusCalendarDate = focusedDay;
                });
              }
            },
          ),
          if (events.containsKey(parseToCorrectDate(_selectCalendarDate)))
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 2.5,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final event =
                          events[parseToCorrectDate(_selectCalendarDate)]
                              ?[index];
                      return ListTile(
                        title: Text(
                            "Contratante: ${ContratantById(event!.contrid)}"),
                        subtitle: Text('Horas para começar: ${event.hours}'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(height: 10);
                    },
                    itemCount:
                        events[parseToCorrectDate(_selectCalendarDate)]!.length)
              ],
            ),
        ]),
      )),
    );
  }
}
