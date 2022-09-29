import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var token = "".obs;
  var userType = 0.obs;
  final box = GetStorage();

  @override
  void onInit() async {
    token.value = await box.read("token");
    userType.value = await box.read("user_type");

    print("TESSTTTTT");

    print(token.value);
    print(userType.value);

    super.onInit();
  }
}
