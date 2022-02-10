import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/last_test_screen.dart';
import 'components/test_screen.dart';
import '../view_models/exam_view_model.dart';
import '../../../components/default_app_bar.dart';
import '../../../base/constant.dart';

class ExamScreen extends GetView<ExamViewModel> {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.makeTest();

    return Scaffold(
      appBar: DefaultAppBar(
        title: controller.title,
      ),
      body: Container(
        color: backgroundColor,
        child: PageView.builder(
          controller: PageController(
            initialPage: 0,
          ),
          itemCount: 7,
          itemBuilder: (_, index) {
            if (index == 6) {
              return LastTestScreen(
                card: controller.card[index],
                clone: controller.clone[index],
                leftRight: Random().nextBool(),
                vm: controller,
                index: index,
              );
            }

            return TestScreen(
              card: controller.card[index],
              clone: controller.clone[index],
              leftRight: Random().nextBool(),
              vm: controller,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
