
import 'package:flutter/material.dart';
import 'package:smart_learning_card/constant.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  final String title = 'Statistics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: defaultTitle,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        decoration: defaultBackground,
        child: Center(
          child: Text(
            'Statistics Screen',
            style: defaultTitle,
          ),
        ),
      ),
    );
  }
}
