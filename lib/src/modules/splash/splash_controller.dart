import 'package:get/get.dart';
import 'package:ttk/src/modules/login/auth_controller.dart';

class SplashController extends GetxController {
  var isBusy = false.obs;

  @override
  void onInit() {
    gotoHomePage();
    super.onInit();
  }

  void gotoHomePage() async {
    isBusy(true);
    await Future.delayed(const Duration(seconds: 4)).then((value) {
      Get.find<AuthController>().gotoHomePage();
    });
    isBusy(false);
  }
}
