import 'package:flutter/material.dart';

class Phase3Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase3';

  @override
  State<Phase3Screen> createState() => _Phase3ScreenState();
}

class _Phase3ScreenState extends State<Phase3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Phase 3'),
      ),
    );
  }
}
