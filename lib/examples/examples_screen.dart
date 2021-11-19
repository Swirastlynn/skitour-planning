import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skitour_planning/movies/ui/movie_list.dart';
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
          ExampleRow(
            text: "People List",
            route: MaterialPageRoute(
              builder: (context) => PeopleListScreen(),
            ),
          ),
          ExampleRow(
            text: "Pie Chart",
            route: MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => MySchedule(),
                child: PiechartHomeScreen(),
              ),
            ),
          ),
          ExampleRow(
            text: "Popular Movies",
            route: MaterialPageRoute(
              builder: (context) => MovieList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleRow extends StatelessWidget {
  final String text;
  final MaterialPageRoute route;

  const ExampleRow({
    Key? key,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                route,
              );
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}
