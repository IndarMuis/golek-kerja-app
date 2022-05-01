import 'package:get/get.dart';

import '../controllers/detail_job_controller.dart';

class DetailJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJobController>(
      () => DetailJobController(),
    );
  }
}
