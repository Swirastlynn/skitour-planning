import 'package:flutter/material.dart';

import 'examples/examples_screen.dart';

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
      home: ExamplesScreen(),
    );
  }
}
