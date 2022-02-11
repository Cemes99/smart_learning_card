
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/route/app_routes.dart';
import '../views/components/body_exam_result.dart';
import '../../../components/pre_login_screen.dart';
import '../../../base/base_view_model.dart';
import '../../../../data/tests/models/test_model.dart';
import '../../../../data/tests/service/test_service.dart';
import '../../../../global/global.dart';

class ExamResultViewModel extends BaseViewModel {
  final String title = 'Thống kê kiểm tra';
  final RxList<TestModel> list = RxList([]);
  final RxInt choose = RxInt(0);

  Widget display() {
    if(global) {
      return BodyExamResult(vm: this,);
    }

    return const PreLoginScreen();
  }

  Future<List<TestModel>> getData() async {
    list.value = [];
    list.value = await TestService().getTestResult();

    return list;
  }

  void goToDetails(int index) {
    choose.value = index;
    Get.toNamed(Routes.examResultDetails);
  }
}