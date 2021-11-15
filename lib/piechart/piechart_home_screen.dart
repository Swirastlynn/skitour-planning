import 'package:flutter/material.dart';

import 'my_chart.dart';
import 'my_slider.dart';

class PiechartHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Change Piechart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MyChart(),
          ),
          Expanded(
            child: MySlider(),
          )
        ],
      ),
    );
  }
}
