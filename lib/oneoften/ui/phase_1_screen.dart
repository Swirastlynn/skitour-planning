import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';

class Phase1Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase1';

  @override
  State<Phase1Screen> createState() => _Phase1ScreenState();
}

class _Phase1ScreenState extends State<Phase1Screen> {
  // Instantiate your class using Get.put() to make it available for all "child" routes there.
  final QuestionsController controller = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 255, 0, 0),
                padding: const EdgeInsets.all(12.0),
                child: Text('Etap I'),
              ),
              Container(
                color: Color.fromARGB(255, 255, 50, 0),
                padding: const EdgeInsets.all(12.0),
                child: Obx(() {
                  return Text('Question ${controller.getQuestionNumber}');
                }),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 255, 100, 0),
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(() {
                    return Text('${controller.getQuestionText}');
                  }),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 255, 100, 0),
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(() {
                    return Text('Answer: ${controller.getQuestionAnswer}');
                  }),
                ),
              ),
              Container(
                color: Color.fromRGBO(0, 255, 255, 1),
                child: Row(
                  children: [
                    Container(
                      color: Color.fromRGBO(0, 255, 0, 1),
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.all(12.0),
                      alignment: Alignment.bottomLeft,
                      child: MaterialButton(
                        onPressed: () {
                          controller.previousQuestion();
                        },
                        child: Text("Poprzednie"),
                      ),
                    ),
                    Spacer(),
                    Container(
                      color: Color.fromRGBO(0, 255, 50, 1),
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.all(12.0),
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                        onPressed: () {
                          controller.nextQuestion();
                        },
                        child: Text("Następne"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
