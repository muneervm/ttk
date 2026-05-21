import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ttk/src/models/user.dart';
import 'package:ttk/src/modules/login/login_page.dart';
import 'package:ttk/src/modules/notification/notifications_page.dart';
import 'package:ttk/src/modules/order/hospital_detail_enter_page.dart';
import 'package:ttk/src/resources/user_profile_repository.dart';

class LandingController extends GetxController
    with GetSingleTickerProviderStateMixin {


  late final _userProfileRepository = UserProfileRepository();
  final user = User().obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void getUser()async{
    final userOffline = await _userProfileRepository.getUserOffline();
    user(userOffline);
    /*final response = await _userProfileRepository.getUser();
    if(response.success){
      _userProfileRepository.saveUser(response.user);
      user(response.user);
    }*/
  }

  @override
  void dispose() {
    super.dispose();
  }

  void menuPressed() {
    //Get.toNamed(MenuPage.routeName);
  }
  void gotoNewOrderPage() {
    Get.toNamed(HospitalDetailEnterPage.routeName);
  }

  void logout() {
    _userProfileRepository.logout();
    Get.offAllNamed(LoginPage.routeName);
  }


  @override
  void onReady() {
    super.onReady();
  }

}
