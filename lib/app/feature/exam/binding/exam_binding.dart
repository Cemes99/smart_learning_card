
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/exam/view_models/exam_view_model.dart';

class ExamBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExamViewModel>(() => ExamViewModel());
  }

}