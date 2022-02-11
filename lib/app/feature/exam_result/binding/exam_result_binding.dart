
import 'package:get/get.dart';
import '../view_models/exam_result_view_model.dart';

class ExamResultBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExamResultViewModel>(() => ExamResultViewModel());
  }

}