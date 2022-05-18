import 'package:get/get.dart';

import '../controllers/saved_page_controller.dart';

class SavedPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedPageController>(
      () => SavedPageController(),
    );
  }
}
