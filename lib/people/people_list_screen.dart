import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skitour_planning/people/post.dart';

import 'details_screen.dart';

class PeopleListScreen extends StatefulWidget {
  PeopleListScreen({Key key}) : super(key: key);

  @override
  _PeopleListScreenState createState() => _PeopleListScreenState();
}

class _PeopleListScreenState extends State<PeopleListScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts'); // todo handle exceptions
    http.Response response = await http.get(dataURL);
    setState(() {
      var decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      posts = decodedJson
          .map<Post>((site) => Post.fromJson(site as Map<String, dynamic>))
          .toList() as List<Post>;
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
        itemCount: posts.length,
        itemBuilder: (_, int position) {
          return getRow(position);
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
          child: Text("Row ${posts[i].title}"),
        ));
  }
}
