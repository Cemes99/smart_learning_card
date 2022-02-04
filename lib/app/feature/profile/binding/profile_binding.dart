
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/profile/view_models/profile_view_model.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }

}