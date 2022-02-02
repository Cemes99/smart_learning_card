
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/register/view_models/register_view_model.dart';

class RegisterBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RegisterViewModel>(() => RegisterViewModel());
  }
}