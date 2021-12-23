import 'package:flutter/material.dart';

class Phase3Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase3';

  @override
  State<Phase3Screen> createState() => _Phase3ScreenState();
}

class _Phase3ScreenState extends State<Phase3Screen> {
  int acceptedData = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.cyan,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Value is updated to: $acceptedData'),
                ),
              );
            },
            onAccept: (int data) {
              if (acceptedData >= 1) {
                setState(() {
                  acceptedData -= data;
                });
              }
            },
            onWillAccept: (item) {
              debugPrint('draggable is on the target $item');
              return true;
            },
            onLeave: (item) {
              debugPrint('draggable has left the target $item');
            },
          ),
          Center(
            child: Stack(
              children: _getDraggable(acceptedData),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _getDraggable(int acceptedData) {
  List<Widget> listings = [];
  int i = 0;
  for (i = 0; i < acceptedData; i++) {
    listings.add(
      Draggable<int>(
        // Data is the value this Draggable stores.
        data: 1,
        child: Container(
          height: 300.0,
          width: 300.0,
          color: Colors.lightGreenAccent,
          child: const Center(
            child: Text('Draggable'),
          ),
        ),
        childWhenDragging: Container(
          height: 300.0,
          width: 300.0,
        ),
        feedback: Container(
          color: Colors.deepOrange,
          height: 300,
          width: 300,
          child: const Icon(Icons.directions_run),
        ),
      ),
    );
  }
  return listings;
}
