import 'package:get/get.dart';

import '../controllers/data_profile_controller.dart';

class DataProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataProfileController>(
      () => DataProfileController(),
    );
  }
}
