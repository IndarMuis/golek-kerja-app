import 'package:get/get.dart';

import '../controllers/recommendation_page_controller.dart';

class RecommendationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendationPageController>(
      () => RecommendationPageController(),
    );
  }
}
