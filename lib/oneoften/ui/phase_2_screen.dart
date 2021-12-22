import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/phase_1_controller.dart';
import 'package:skitour_planning/oneoften/ui/paper_sheet.dart';
import 'package:skitour_planning/oneoften/ui/random_generator.dart';

class Phase2Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase2';

  @override
  State<Phase2Screen> createState() => _Phase2ScreenState();
}

class _Phase2ScreenState extends State<Phase2Screen> {
  final Phase1Controller controller = Get.put(Phase1Controller());
  final RandomGenerator randomGenerator = RandomGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
          color: Colors.white,
          child: Stack(
            children: [
              PaperSheet(
                  controller: controller,
                  color: Colors.green,
                  rotationZ: randomGenerator.nextRadius()),
              PaperSheet(
                  controller: controller,
                  color: Colors.deepOrangeAccent,
                  rotationZ: randomGenerator.nextRadius()),
              PaperSheet(
                  controller: controller,
                  color: Colors.deepPurpleAccent,
                  rotationZ: randomGenerator.nextRadius()),
              PaperSheet(
                  controller: controller,
                  color: Colors.red,
                  rotationZ: randomGenerator.nextRadius()),
            ],
          ),
        ),
      ),
    );
  }
}
