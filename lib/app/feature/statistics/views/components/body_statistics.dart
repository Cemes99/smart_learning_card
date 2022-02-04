import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/statistics_view_model.dart';

class BodyStatistics extends StatelessWidget {
  const BodyStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StatisticsViewModel vm = StatisticsViewModel();

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Obx(
          () => Text(
            vm.content.value,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
