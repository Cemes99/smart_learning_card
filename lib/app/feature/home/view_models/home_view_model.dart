
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/history.dart';
import '../../list_topic/views/list_topic.dart';
import '../../../screens/profile.dart';
import '../../../screens/statistics.dart';
import '../../../base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  
  RxInt index = RxInt(0);

  final List<String> listTitle = const [
    'List Topic',
    'History',
    'Statistics',
    'Profile'
  ];

  final List<Widget> list = const [
    ListTopicScreen(),
    HistoryScreen(),
    StatisticsScreen(),
    ProfileScreen()
  ].obs;

  void changeIndex(int index) {
    this.index.value = index;
  }
}
