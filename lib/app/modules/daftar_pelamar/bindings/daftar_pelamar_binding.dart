import 'package:get/get.dart';

import '../controllers/daftar_pelamar_controller.dart';

class DaftarPelamarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarPelamarController>(
      () => DaftarPelamarController(),
    );
  }
}
