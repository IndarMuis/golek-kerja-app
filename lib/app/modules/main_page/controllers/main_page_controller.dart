import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/modules/recommendation_page/controllers/recommendation_page_controller.dart';

class MainPageController extends GetxController {
  var recommendedationPageController = Get.put(RecommendationPageController());
  TextEditingController searchController = new TextEditingController();
}
