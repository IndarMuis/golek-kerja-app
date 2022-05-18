import 'package:get/get.dart';

import '../controllers/job_vacancy_controller.dart';

class JobVacancyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobVacancyController>(
      () => JobVacancyController(),
    );
  }
}
