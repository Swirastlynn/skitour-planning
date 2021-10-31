import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class PeopleListScreen extends StatefulWidget {
  PeopleListScreen({Key key}) : super(key: key);

  @override
  _PeopleListScreenState createState() => _PeopleListScreenState();
}

class _PeopleListScreenState extends State<PeopleListScreen> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('People List'),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
          // todo how to do getRow(widgets[position]) to extract data from UI? How to know what's the type of widgets[position]?
        },
      ),
    );
  }

  // todo extract to SingleListWidget widget. Use explicit type for json parsed object
  Widget getRow(int i) {
    return MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text("Row ${widgets[i]["title"]}"),
        ));
  }
}
