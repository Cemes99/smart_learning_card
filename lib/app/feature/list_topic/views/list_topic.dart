import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/list_topic/view_models/list_topic_view_model.dart';
import '../../../base/constant.dart';
import 'topic_rounded.dart';
import '../../../data/list_topic.dart';
import '../../../models/topic_model.dart';

class ListTopicScreen extends GetView<ListTopicViewModel> {
  const ListTopicScreen({Key? key}) : super(key: key);

  final String title = 'List Topic';

  @override
  Widget build(BuildContext context) {
    List<TopicModel> list = listTopic;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 30),
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return TopicRounded(topic: list[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
