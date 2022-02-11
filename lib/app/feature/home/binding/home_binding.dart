
import 'package:get/get.dart';
import '../view_models/home_view_model.dart';
import '../../exam_result/view_models/exam_result_view_model.dart';
import '../../list_topic/view_models/list_topic_view_model.dart';
import '../../profile/view_models/profile_view_model.dart';
import '../../statistics/view_models/statistics_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());

    Get.lazyPut<ListTopicViewModel>(() => ListTopicViewModel());
    Get.lazyPut<ExamResultViewModel>(() => ExamResultViewModel());
    Get.lazyPut<StatisticsViewModel>(() => StatisticsViewModel());
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}