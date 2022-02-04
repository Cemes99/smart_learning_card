
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/exam/view_models/exam_view_model.dart';
import 'package:smart_learning_card/app/feature/home/view_models/home_view_model.dart';
import 'package:smart_learning_card/app/feature/list_topic/view_models/list_topic_view_model.dart';
import 'package:smart_learning_card/app/feature/profile/view_models/profile_view_model.dart';
import 'package:smart_learning_card/app/feature/statistics/view_models/statistics_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());

    Get.lazyPut<ListTopicViewModel>(() => ListTopicViewModel());
    Get.lazyPut<ExamViewModel>(() => ExamViewModel());
    Get.lazyPut<StatisticsViewModel>(() => StatisticsViewModel());
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}