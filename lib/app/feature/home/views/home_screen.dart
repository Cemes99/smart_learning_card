import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/base/constant.dart';
import 'package:smart_learning_card/app/feature/home/view_models/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => IndexedStack(
              index: controller.index.value,
              children: controller.list,
            ),
          ),
          bottomNavigationBar: Container(
            decoration:
                const BoxDecoration(border: Border(top: defaultAppBarLine)),
            child: Obx(
              () => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                backgroundColor: backgroundColor,
                selectedLabelStyle: const TextStyle(fontSize: 0),
                unselectedLabelStyle: const TextStyle(fontSize: 0),
                currentIndex: controller.index.value,
                onTap: controller.changeIndex,
                items: const [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home_rounded,
                      color: Colors.yellow,
                    ),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.history_rounded,
                      color: Colors.yellow,
                    ),
                    icon: Icon(
                      Icons.history_outlined,
                      color: Colors.grey,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.yellow,
                    ),
                    icon: Icon(
                      Icons.bar_chart_outlined,
                      color: Colors.grey,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.person_rounded,
                      color: Colors.yellow,
                    ),
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.grey,
                    ),
                    label: "",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
