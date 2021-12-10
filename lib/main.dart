import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import 'package:skitour_planning/oneoften/one_of_ten_screen.dart';
import 'package:skitour_planning/people/details_screen.dart';
import 'package:skitour_planning/people/people_list_screen.dart';
import 'package:skitour_planning/piechart/my_schedule.dart';
import 'package:skitour_planning/piechart/piechart_home_screen.dart';

import 'examples/examples_screen.dart';

void main() {
  runApp(TatraSkitourApp());
}

class TatraSkitourApp extends StatelessWidget {
  static const ROOT_ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Skitury w Tatrach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: ROOT_ROUTE, page: () => ExamplesScreen()),
        GetPage(name: PeopleListScreen.ROUTE, page: () => PeopleListScreen()),
        GetPage(
            name: DetailsScreen.ROUTE, page: () => DetailsScreen(), transition: Transition.zoom),
        GetPage(
            name: PiechartHomeScreen.ROUTE,
            page: () => ChangeNotifierProvider(
                  create: (context) => MySchedule(),
                  child: PiechartHomeScreen(),
                ),
            transition: Transition.zoom),
        GetPage(name: OneOfTen.ROUTE, page: () => OneOfTen(), transition: Transition.fadeIn),
      ],
    );
  }
}
