import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/phase_1_controller.dart';
import 'package:skitour_planning/oneoften/ui/random_generator.dart';

class PaperSheet extends StatelessWidget {
  PaperSheet({
    Key? key,
  }) : super(key: key);

  final Phase1Controller controller = Get.find();
  final RandomGenerator randomGenerator = RandomGenerator();

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(randomGenerator.nextRadius()),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Container(
          color: randomGenerator.nextColor(),
          child: Column(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Obx(
                  () {
                    return Text('${controller.currentQuestionText}');
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Obx(() {
                  return Center(
                    child: Text('Odpowiedź: ${controller.currentQuestionAnswer}'),
                  );
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
