import 'package:flutter/material.dart';
import 'package:skitour_planning/list_route.dart';

import 'state_providers_example_route.dart';

void main() {
  runApp(TatraSkitourApp());
}

class TatraSkitourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skitury w Tatrach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplesRoute(),
    );
  }
}

class ExamplesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Planowanie'),
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
                          MaterialPageRoute(builder: (context) => ListRoute()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("List"),
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
                              builder: (context) =>
                                  StateProvidersExampleRoute()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("State Management"),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
