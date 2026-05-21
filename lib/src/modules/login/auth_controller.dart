import 'package:get/get.dart';
import 'package:ttk/src/modules/landing/landing_page.dart';
import 'package:ttk/src/modules/login/login_page.dart';
import 'package:ttk/src/modules/register/register_success_dialog.dart';
import 'package:ttk/src/resources/auth_repository.dart';
import 'package:ttk/src/resources/user_profile_repository.dart';
import 'package:ttk/src/widgets/custom/app_dialog.dart';

class AuthController extends GetxController {
  late final busy = false.obs;

  late final _authRepository = AuthRepository();
  late final _userProfileRepository = UserProfileRepository();


  void gotoHomePage() async {
    busy(true);
    String token = await _authRepository.getAccessToken();
    final user = await _userProfileRepository.getUserOffline();
    if (token.isNotEmpty) {
      _gotoLandingPage();
    } else {
      gotoLoginPage();
    }
    busy(false);
  }

  void gotoLandingPage() async {
    busy(false);
    _gotoLandingPage();
  }

  void _gotoLandingPage() {
    Get.offAllNamed(LandingPage.routeName);
  }

  void gotoLoginPage() async {
    Get.offAllNamed(LoginPage.routeName);
  }


  void login(String token) async {
    busy(true);
    try {
      final response = await _authRepository.login(token);
      if (response.success) {
        //await _authRepository.saveAccessToken('${response.tokenType} ${response.accessToken}');
        await _authRepository.saveAccessToken('${response.tokenType} $token');
        await _userProfileRepository.saveUser(response.user);
        gotoHomePage();
      } else {
        AppDialog.showSnackBar('Login Failed', response.message);
      }
    } catch (_) {
      print(_.toString());
      AppDialog.showSnackBar('Login Failed', 'Something went wrong');
    } finally {
      busy(false);
    }
  }


  void register(String role, String name,String lastName, String email, String phone) async {
    busy(true);
    try {
      final response = await _authRepository.register(role, name,lastName, email, phone);
      if (response.success) {
        /*await _authRepository
            .saveAccessToken('${response.tokenType} ${response.accessToken}');
        await _userProfileRepository.saveUser(response.user);*/
        Get.dialog(
          RegisterSuccessDialog(gotoHome: gotoHomePage),
          barrierDismissible: false,
          useSafeArea: true,
        );
      } else {
        AppDialog.showSnackBar('Register Failed', response.message);
      }
    } catch (_) {
      print(_.toString());
      AppDialog.showSnackBar('Register Failed', 'Something went wrong');
    } finally {
      busy(false);
    }
  }
}
