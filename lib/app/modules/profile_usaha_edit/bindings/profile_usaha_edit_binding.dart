import 'package:get/get.dart';

import '../controllers/profile_usaha_edit_controller.dart';

class ProfileUsahaEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUsahaEditController>(
      () => ProfileUsahaEditController(),
    );
  }
}
