import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../route/app_routes.dart';
import '../../../base/base_view_model.dart';
import '../../../../global/global.dart';
import '../../../../data/topics/models/topic_model.dart';
import '../../../../data/topics/service/topic_service.dart';

class ListCardViewModel extends BaseViewModel {
  final RxList list = RxList([]);
  final TopicModel model = Get.arguments;

  Future<void> getCard(String name) async {
    list.value = [];
    list.value = await TopicService().getCards(name);
  }

  void goToExam() {
    if (global) {
      Get.toNamed(Routes.exam, arguments: Get.arguments);
    } else {
      Get.defaultDialog(
        title: 'Không thể làm bài kiểm tra',
        titleStyle: ThemeData().textTheme.headline2,
        middleText: 'Cần đăng nhập để sử dụng chức năng này',
        middleTextStyle: ThemeData().textTheme.bodyText2,
        confirm: TextButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('OK'),
        ),
      );
    }
  }
}
