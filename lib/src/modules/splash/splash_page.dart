import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/splash/splash_controller.dart';
import 'package:ttk/src/widgets/custom/app_logo.dart';
import 'package:ttk/src/widgets/tiny/image_view.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  static const routeName = '/';

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset(
                'assets/images/splash_top.png',
                fit: BoxFit.fill,
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/splash_bottom.png',
                fit: BoxFit.fill,
              )),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  height: AppSpacings.small,
                ),
                AppLogo(),
                SizedBox(
                  height: AppSpacings.xxxLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
