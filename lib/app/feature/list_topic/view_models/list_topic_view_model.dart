
import 'package:get/get.dart';

import '../../../base/base_view_model.dart';
import '../../../../data/topics/models/topic_model.dart';
import '../../../route/app_routes.dart';
import '../../../data/list_topic.dart';

class ListTopicViewModel extends BaseViewModel {
  final String title = 'Danh sách chủ đề';
  final List<TopicModel> list = listTopic;

  void toListCard(TopicModel topic) {
    Get.toNamed(Routes.listCard, arguments: topic);
  }
}