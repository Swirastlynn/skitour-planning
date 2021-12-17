import 'package:flutter/material.dart';

class Phase2Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase2';

  @override
  State<Phase2Screen> createState() => _Phase2ScreenState();
}

class _Phase2ScreenState extends State<Phase2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Phase 2'),
      ),
    );
  }
}
