
import 'package:get/get.dart';
import '../view_models/list_card_view_model.dart';

class ListCardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ListCardViewModel>(() => ListCardViewModel());
  }

}