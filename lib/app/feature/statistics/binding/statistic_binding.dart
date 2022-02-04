
import 'package:get/get.dart';
import '../view_models/statistics_view_model.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StatisticsViewModel>(() => StatisticsViewModel());
  }

}