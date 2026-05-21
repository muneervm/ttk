import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ttk/src/modules/login/auth_controller.dart';
import 'package:ttk/src/modules/login/login_page.dart';
import 'package:ttk/src/modules/register/register_success_dialog.dart';
import 'package:ttk/src/resources/auth_repository.dart';
import 'package:ttk/src/widgets/custom/app_dialog.dart';

class RegisterController extends GetxController {
  late var busy = false.obs;
  var role = "".obs;

  late final textControllerName = TextEditingController();
  late final textControllerLastName = TextEditingController();
  late final textControllerEmail = TextEditingController();
  late final textControllerPhone = TextEditingController();

  late final _authRepository = AuthRepository();

  late final _authController = Get.find<AuthController>();

  @override
  void onInit() {
    busy = _authController.busy;
    super.onInit();
  }

  void register() async {
    busy(true);
    try {
      if (validate()) {
       _authController.register(role.value, textControllerName.text,textControllerLastName.text,
            textControllerEmail.text, textControllerPhone.text);
      }else{
        busy(false);
      }
    } catch (_) {
      AppDialog.showSnackBar('Register Failed', 'Something went wrong.');
    }finally{

    }
  }

  bool validate(){
    if(textControllerName.text.isEmpty){
      AppDialog.showSnackBar('Invalid First Name', 'Please enter a valid first name');
      return false;
    }else if(textControllerLastName.text.isEmpty){
      AppDialog.showSnackBar('Invalid Last Name', 'Please enter a valid last name');
      return false;
    }else if(textControllerEmail.text.isEmpty || !textControllerEmail.text.isEmail){
      AppDialog.showSnackBar('Invalid Email', 'Please enter a valid email');
      return false;
    }else if(textControllerPhone.text.isEmpty || !textControllerPhone.text.isPhoneNumber){
      AppDialog.showSnackBar('Invalid Phone number', 'Please enter a valid phone number');
      return false;
    }else if(role.isEmpty){
      AppDialog.showSnackBar('Invalid Role', 'Please select a role');
      return false;
    }else{
      return true;
    }
  }

  void gotoLoginPage() {
    Get.offAllNamed(LoginPage.routeName);
  }

  void onRoleChanged(String value){
    role(value);
  }

}
