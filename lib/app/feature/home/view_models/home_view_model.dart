
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/exam/views/exam_screen.dart';

import '../../list_topic/views/list_topic.dart';
import '../../profile/views/profile.dart';
import '../../statistics/views/statistics.dart';
import '../../../base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  
  RxInt index = RxInt(0);

  final List<Widget> list = const [
    ListTopicScreen(),
    ExamScreen(),
    StatisticsScreen(),
    ProfileScreen()
  ].obs;

  void changeIndex(int index) {
    this.index.value = index;
  }
}
