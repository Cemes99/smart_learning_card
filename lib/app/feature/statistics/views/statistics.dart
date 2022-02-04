
import 'package:flutter/material.dart';
import 'package:smart_learning_card/app/base/constant.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  final String title = 'Statistics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Text(
            'Statistics Screen',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
