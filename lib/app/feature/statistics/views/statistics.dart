
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/statistics_view_model.dart';
import 'components/app_bar_statistics.dart';

class StatisticsScreen extends GetView<StatisticsViewModel> {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStatistics(),
      body: controller.display(),
    );
  }
}
