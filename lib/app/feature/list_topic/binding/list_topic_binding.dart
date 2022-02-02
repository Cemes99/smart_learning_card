
import 'package:get/get.dart';
import '../view_models/list_topic_view_model.dart';

class ListTopicBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ListTopicViewModel>(() => ListTopicViewModel());
  }
}