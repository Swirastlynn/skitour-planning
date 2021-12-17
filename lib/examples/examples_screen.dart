import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/ui/one_of_ten_screen.dart';
import 'package:skitour_planning/people/people_list_screen.dart';
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
            path: PeopleListScreen.ROUTE,
          ),
          ExampleRow(
            text: "Pie Chart",
            path: PiechartHomeScreen.ROUTE,
          ),
          ExampleRow(
            text: "1 z 10",
            path: OneOfTenScreen.ROUTE,
          ),
        ],
      ),
    );
  }
}

class ExampleRow extends StatelessWidget {
  final String text;
  final String path;

  const ExampleRow({
    Key? key,
    required this.text,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              Get.toNamed(path);
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
