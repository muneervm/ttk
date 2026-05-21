import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ttk/src/modules/landing/landing_page.dart';
import 'package:ttk/src/modules/login/auth_controller.dart';
import 'package:ttk/src/modules/login/login_page.dart';
import 'package:ttk/src/modules/register/register_page.dart';
import 'package:ttk/src/resources/auth_repository.dart';
import 'package:ttk/src/widgets/custom/app_dialog.dart';

class LoginController extends GetxController {
  late var busy = false.obs;

  late final textControllerToken = TextEditingController();

  late final _authRepository = AuthRepository();

  late final _authController = Get.find<AuthController>();

  @override
  void onInit() {
    busy = _authController.busy;
    super.onInit();
  }


  void verifyPhone() async {
    busy(true);
    try {
      if (textControllerToken.text.isNotEmpty) {
       Get.find<AuthController>().login(textControllerToken.text);
      } else {
        AppDialog.showSnackBar(
            'Invalid token', 'Please check the token.');
        busy(false);
      }
    } catch (_) {
      print(_.toString());
      AppDialog.showSnackBar('Login Failed', 'Something went wrong.');
      busy(false);
    }
  }


  bool validate(){
    if(textControllerToken.text.isEmpty){
      AppDialog.showSnackBar('Invalid Token', 'Please enter a valid token');
      return false;
    }else{
      return true;
    }
  }

  void gotoLoginPage() {
    Get.offAllNamed(LoginPage.routeName);
  }

  void gotoLandingPage() {
    Get.offAllNamed(LandingPage.routeName);
  }

  void gotoRegistration() {
    Get.toNamed(RegisterPage.routeName);
  }

  void gotoTermsCondition() {}
}
