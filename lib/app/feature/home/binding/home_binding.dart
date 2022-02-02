
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/home/view_models/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}