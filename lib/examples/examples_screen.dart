import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skitour_planning/people/people_list_screen.dart';
import 'package:skitour_planning/piechart/my_schedule.dart';
import 'package:skitour_planning/piechart/piechart_home_screen.dart';

class ExamplesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Examples'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PeopleListScreen()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("People List"),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => MySchedule(),
                                    child: PiechartHomeScreen(),
                                  )),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("Pie Chart"),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
