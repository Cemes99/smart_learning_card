import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/components/default_app_bar.dart';
import '../view_models/exam_result_view_model.dart';
import '../../../base/constant.dart';

class ExamResultDetails extends GetView<ExamResultViewModel> {
  const ExamResultDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _spacer = const SizedBox(height: 7,);

    return Scaffold(
      appBar: DefaultAppBar(title: controller.list[controller.choose.value].topic),
      body: Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: paddingSide,
          right: paddingSide,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ngày làm bài: ${_formatDate(
                controller.list[controller.choose.value].dateTime,
              )}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            _spacer,
            Text(
              'Câu hỏi: ${controller.list[controller.choose.value].question.toString()}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            _spacer,
            Text(
              'Đáp án: ${controller.list[controller.choose.value].answer.toString()}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            _spacer,
            Text(
              'Số điểm: ${controller.list[controller.choose.value].score}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.hour}:${date.minute}:${date.second}, ${date.day}/${date.month}/${date.year}';
  }
}
