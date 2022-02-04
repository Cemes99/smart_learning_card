import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/default_app_bar.dart';
import '../view_models/list_topic_view_model.dart';
import 'components/topic_rounded.dart';

class ListTopicScreen extends GetView<ListTopicViewModel> {
  const ListTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: controller.title),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 30),
          scrollDirection: Axis.vertical,
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            return TopicRounded(topic: controller.list[index]);
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
