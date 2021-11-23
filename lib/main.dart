import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skitour_planning/people/people_list_screen.dart';
import 'package:skitour_planning/piechart/my_schedule.dart';
import 'package:skitour_planning/piechart/piechart_home_screen.dart';

import 'examples/examples_screen.dart';

void main() {
  runApp(TatraSkitourApp());
}

class TatraSkitourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skitury w Tatrach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ExamplesScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/people': (context) => PeopleListScreen(), // todo move routes to widget classes
        '/piechart': (context) => ChangeNotifierProvider(
              create: (context) => MySchedule(),
              child: PiechartHomeScreen(),
            ),
      },
    );
  }
}
