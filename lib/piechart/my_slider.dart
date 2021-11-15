import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_schedule.dart';

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);
    return Slider(
      value: schedule.stateManagementValue,
      onChanged: (value) => schedule.stateManagementValue = value,
    );
  }
}
