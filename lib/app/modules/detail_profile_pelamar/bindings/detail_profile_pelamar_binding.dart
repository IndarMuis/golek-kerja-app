import 'package:get/get.dart';

import '../controllers/detail_profile_pelamar_controller.dart';

class DetailProfilePelamarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProfilePelamarController>(
      () => DetailProfilePelamarController(),
    );
  }
}
