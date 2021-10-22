import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleArchitectureAppPage extends StatefulWidget {
  SimpleArchitectureAppPage({Key key}) : super(key: key);

  @override
  _SimpleArchitectureAppPageState createState() => _SimpleArchitectureAppPageState();
}

class _SimpleArchitectureAppPageState extends State<SimpleArchitectureAppPage> {
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
      appBar: AppBar(
        title: Text('Planowanie'),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }
}
