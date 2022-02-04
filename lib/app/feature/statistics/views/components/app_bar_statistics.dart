import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/statistics_view_model.dart';
import '../../../../base/constant.dart';

class AppBarStatistics extends StatelessWidget implements PreferredSizeWidget {
  const AppBarStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StatisticsViewModel vm = StatisticsViewModel();

    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Obx(
        () => Text(
          vm.title.value,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      centerTitle: true,
      shape: const Border(bottom: defaultAppBarLine),
      actions: [
        IconButton(
          onPressed: vm.changeScreen,
          icon: Obx(() => vm.icon.value),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
