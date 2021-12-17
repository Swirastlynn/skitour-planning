import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:skitour_planning/oneoften/presentation/phase_1_controller.dart';

class Phase1Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase1';

  @override
  State<Phase1Screen> createState() => _Phase1ScreenState();
}

class _Phase1ScreenState extends State<Phase1Screen> {
  // Instantiate your class using Get.put() to make it available for all "child" routes there.
  final Phase1Controller controller = Get.put(Phase1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Etap I'),
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Pytanie ${controller.currentQuestionNumber}'),
              );
            }),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('${controller.currentQuestionText}'),
              );
            }),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      controller.decrement();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Poprzednie"),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      controller.increment();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Następne"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
