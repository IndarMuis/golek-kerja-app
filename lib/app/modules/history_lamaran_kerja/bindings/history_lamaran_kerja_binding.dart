import 'package:get/get.dart';

import '../controllers/history_lamaran_kerja_controller.dart';

class HistoryLamaranKerjaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryLamaranKerjaController>(
      () => HistoryLamaranKerjaController(),
    );
  }
}
