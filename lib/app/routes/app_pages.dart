import 'package:get/get.dart';

import 'package:lokerku/app/modules/add_job/bindings/add_job_binding.dart';
import 'package:lokerku/app/modules/add_job/views/add_job_view.dart';
import 'package:lokerku/app/modules/add_job/views/continued_page_add_job_view.dart';
import 'package:lokerku/app/modules/daftar_pelamar/bindings/daftar_pelamar_binding.dart';
import 'package:lokerku/app/modules/daftar_pelamar/views/daftar_pelamar_view.dart';
import 'package:lokerku/app/modules/data_profile/bindings/data_profile_binding.dart';
import 'package:lokerku/app/modules/data_profile/views/data_profile_view.dart';
import 'package:lokerku/app/modules/data_usaha/bindings/data_usaha_binding.dart';
import 'package:lokerku/app/modules/data_usaha/views/data_usaha_view.dart';
import 'package:lokerku/app/modules/detail_job/bindings/detail_job_binding.dart';
import 'package:lokerku/app/modules/detail_job/views/detail_job_view.dart';
import 'package:lokerku/app/modules/detail_profile_pelamar/bindings/detail_profile_pelamar_binding.dart';
import 'package:lokerku/app/modules/detail_profile_pelamar/views/detail_profile_pelamar_view.dart';
import 'package:lokerku/app/modules/history_lamaran_kerja/bindings/history_lamaran_kerja_binding.dart';
import 'package:lokerku/app/modules/history_lamaran_kerja/views/history_lamaran_kerja_view.dart';
import 'package:lokerku/app/modules/home/bindings/home_binding.dart';
import 'package:lokerku/app/modules/home/views/home_view.dart';
import 'package:lokerku/app/modules/job_history/bindings/job_history_binding.dart';
import 'package:lokerku/app/modules/job_history/views/job_history_view.dart';
import 'package:lokerku/app/modules/job_vacancy/bindings/job_vacancy_binding.dart';
import 'package:lokerku/app/modules/login/bindings/login_binding.dart';
import 'package:lokerku/app/modules/login/views/login_view.dart';
import 'package:lokerku/app/modules/main_page/bindings/main_page_binding.dart';
import 'package:lokerku/app/modules/main_page/views/main_page_view.dart';
import 'package:lokerku/app/modules/notification/bindings/notification_binding.dart';
import 'package:lokerku/app/modules/notification/views/notification_view.dart';
import 'package:lokerku/app/modules/pengalaman/bindings/pengalaman_binding.dart';
import 'package:lokerku/app/modules/pengalaman/views/pengalaman_view.dart';
import 'package:lokerku/app/modules/profile_page/bindings/profile_page_binding.dart';
import 'package:lokerku/app/modules/profile_page/views/profile_edit_page_view.dart';
import 'package:lokerku/app/modules/profile_page/views/profile_page_view.dart';
import 'package:lokerku/app/modules/profile_usaha_edit/bindings/profile_usaha_edit_binding.dart';
import 'package:lokerku/app/modules/profile_usaha_edit/views/profile_usaha_edit_view.dart';
import 'package:lokerku/app/modules/recommendation_page/bindings/recommendation_page_binding.dart';
import 'package:lokerku/app/modules/recommendation_page/views/recommendation_page_view.dart';
import 'package:lokerku/app/modules/register/bindings/register_binding.dart';
import 'package:lokerku/app/modules/register/views/register_view.dart';
import 'package:lokerku/app/modules/saved_page/bindings/saved_page_binding.dart';
import 'package:lokerku/app/modules/saved_page/views/saved_page_view.dart';

import '../modules/job_vacancy/views/job_vacancy_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_JOB,
      page: () => DetailJobView(),
      binding: DetailJobBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_JOB,
      page: () => AddJobView(),
      binding: AddJobBinding(),
    ),
    GetPage(
      name: _Paths.CONTINUED_PAGE_ADD_JOB,
      page: () => ContinuedPageAddJobView(),
      binding: AddJobBinding(),
    ),
    GetPage(
      name: _Paths.RECOMMENDATION_PAGE,
      page: () => RecommendationPageView(),
      binding: RecommendationPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.SAVED_PAGE,
      page: () => SavedPageView(),
      binding: SavedPageBinding(),
    ),
    GetPage(
      name: _Paths.JOB_VACANCY,
      page: () => JobVacancyView(),
      binding: JobVacancyBinding(),
    ),
    GetPage(
      name: _Paths.JOB_HISTORY,
      page: () => JobHistoryView(),
      binding: JobHistoryBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE_EDIT,
        page: () => ProfileEditPageView(),
        binding: ProfilePageBinding()),
    GetPage(
      name: _Paths.DATA_USAHA,
      page: () => DataUsahaView(),
      binding: DataUsahaBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PROFILE,
      page: () => DataProfileView(),
      binding: DataProfileBinding(),
    ),
    GetPage(
      name: _Paths.PENGALAMAN,
      page: () => PengalamanView(),
      binding: PengalamanBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_USAHA_EDIT,
      page: () => ProfileUsahaEditView(),
      binding: ProfileUsahaEditBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_PELAMAR,
      page: () => DaftarPelamarView(),
      binding: DaftarPelamarBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PROFILE_PELAMAR,
      page: () => DetailProfilePelamarView(),
      binding: DetailProfilePelamarBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_LAMARAN_KERJA,
      page: () => HistoryLamaranKerjaView(),
      binding: HistoryLamaranKerjaBinding(),
    ),
  ];
}
