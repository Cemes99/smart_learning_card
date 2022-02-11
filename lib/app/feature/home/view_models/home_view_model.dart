
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exam_result/views/exam_result.dart';
import '../../list_topic/views/list_topic.dart';
import '../../profile/views/profile.dart';
import '../../statistics/views/statistics.dart';
import '../../../base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  
  RxInt index = RxInt(0);

  final List<Widget> list = const [
    ListTopicScreen(),
    ExamResultScreen(),
    StatisticsScreen(),
    ProfileScreen()
  ].obs;

  void changeIndex(int index) {
    this.index.value = index;
  }
}
