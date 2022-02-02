
import 'package:get/get.dart';
import '../../../base/base_view_model.dart';
import '../../../models/topic_model.dart';
import '../../../route/app_routes.dart';

class ListTopicViewModel extends BaseViewModel {

  void toListCard(TopicModel topic) {
    Get.toNamed(Routes.listCard, arguments: topic);
  }
}