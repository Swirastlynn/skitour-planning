import 'package:flutter/material.dart';
import 'package:skitour_planning/simple_architecture_app_page.dart';

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
      home: SimpleArchitectureAppPage(),
    );
  }
}
