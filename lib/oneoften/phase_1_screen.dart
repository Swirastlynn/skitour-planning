import 'package:flutter/material.dart';

class Phase1Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase1';

  @override
  State<Phase1Screen> createState() => _Phase1ScreenState();
}

class _Phase1ScreenState extends State<Phase1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Phase 1'),
      ),
    );
  }
}
