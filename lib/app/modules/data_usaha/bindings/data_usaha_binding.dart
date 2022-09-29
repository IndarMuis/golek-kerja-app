import 'package:get/get.dart';

import '../controllers/data_usaha_controller.dart';

class DataUsahaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataUsahaController>(
      () => DataUsahaController(),
    );
  }
}
