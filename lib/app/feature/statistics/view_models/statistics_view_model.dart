
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/components/pre_login_screen.dart';
import 'package:smart_learning_card/app/feature/statistics/views/components/body_statistics.dart';
import 'package:smart_learning_card/global/global.dart';
import '../../../base/base_view_model.dart';

class StatisticsViewModel extends BaseViewModel {
  final String _titleStatistics = 'Thống kê';
  final String _titleHistory = 'Lịch sử';

  final String _contentStatistics = 'Statistics Screen';
  final String _contentHistory = 'History Screen';

  final Icon _iconStatistics = const Icon(Icons.bar_chart_rounded);
  final Icon _iconHistory = const Icon(Icons.history_rounded);

  final RxString title = RxString('Thống kê');
  final Rx<Icon> icon = Rx(const Icon(Icons.bar_chart_rounded));
  final RxString content = RxString('Statistics Screen');
  final RxBool isStatistics = RxBool(true);

  void changeScreen() {
    if(!global) return ;
    isStatistics.value = !isStatistics.value;

    isStatistics.value ? title.value = _titleStatistics : title.value = _titleHistory;
    isStatistics.value ? icon.value = _iconHistory : icon.value = _iconStatistics;
    isStatistics.value ? content.value = _contentStatistics : content.value = _contentHistory;
  }

  Widget display() {
    if(global) {
      return const BodyStatistics();
    }

    return const PreLoginScreen();
  }

}