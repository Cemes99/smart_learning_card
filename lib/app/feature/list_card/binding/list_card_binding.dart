
import 'package:get/get.dart';
import 'package:smart_learning_card/app/feature/list_card/view_models/ListCardViewModel.dart';

class ListCardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ListCardViewModel>(() => ListCardViewModel());
  }

}