import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/phase_1_screen.dart';

class OneOfTenScreen extends StatefulWidget {
  static const ROUTE = '/oneoften';

  @override
  State<OneOfTenScreen> createState() => _OneOfTenScreenState();
}

class _OneOfTenScreenState extends State<OneOfTenScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('menu'),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Etap 1'),
                        ),
                        onPressed: () {
                          Get.toNamed(Phase1Screen.ROUTE);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Etap 2'),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Etap 3'),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
