import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const ROUTE = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text("DETAILS PAGE"),
      ),
    );
  }
}
