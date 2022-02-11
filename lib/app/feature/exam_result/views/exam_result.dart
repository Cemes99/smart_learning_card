import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/base/constant.dart';
import '../view_models/exam_result_view_model.dart';

class ExamResultScreen extends GetView<ExamResultViewModel> {
  const ExamResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          controller.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
        actions: [
          IconButton(
            onPressed: () async => controller.getData(),
            icon: const Icon(Icons.rotate_left_rounded),
          ),
        ],
      ),
      body: controller.display(),
    );
  }
}
