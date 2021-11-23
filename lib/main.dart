import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:skitour_planning/people/details_screen.dart';
import 'package:skitour_planning/people/people_list_screen.dart';
import 'package:skitour_planning/piechart/my_schedule.dart';
import 'package:skitour_planning/piechart/piechart_home_screen.dart';

import 'examples/examples_screen.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() {
  runApp(TatraSkitourApp());
}

class TatraSkitourApp extends StatelessWidget {
  static const ROOT_ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skitury w Tatrach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        ROOT_ROUTE: (context) => ExamplesScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        PeopleListScreen.ROUTE: (context) => PeopleListScreen(),
        DetailsScreen.ROUTE: (context) => DetailsScreen(),
        PiechartHomeScreen.ROUTE: (context) => ChangeNotifierProvider(
              create: (context) => MySchedule(),
              child: PiechartHomeScreen(),
            ),
      },
    );
  }
}
