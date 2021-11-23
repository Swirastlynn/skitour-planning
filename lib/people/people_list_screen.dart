import 'package:flutter/material.dart';
import 'package:skitour_planning/general/network/api_manager.dart';
import 'package:skitour_planning/people/post.dart';

import 'details_screen.dart';

class PeopleListScreen extends StatefulWidget {
  static const ROUTE = '/people';

  PeopleListScreen({Key? key}) : super(key: key);

  @override
  _PeopleListScreenState createState() => _PeopleListScreenState();
}

class _PeopleListScreenState extends State<PeopleListScreen> {
  final ApiManager apiManager = ApiManager();
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    try {
      var jsonResponse = await apiManager
          .getAPICall(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      setState(() {
        posts = jsonResponse.map<Post>((site) => Post.fromJson(site)).toList()
            as List<Post>;
      });
    } on Exception catch (error) {
      print('Exception $error'); // there should be appropriate handling
    }
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
        Navigator.pushNamed(
          context,
          DetailsScreen.ROUTE,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("Row ${posts[i].title}"),
      ),
    );
  }
}
