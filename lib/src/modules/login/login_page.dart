import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/login/login_controller.dart';
import 'package:ttk/src/widgets/custom/app_logo.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset(
                'assets/images/app_top_wave.png',
                fit: BoxFit.fill,
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/app_bottom.png',
                fit: BoxFit.fill,
              )),
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(AppPaddings.authContent),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppSpacings.small,
                    ),
                    const Expanded(child: AppLogo(isBlue: true,)),
                    Expanded(
                      child: Column(
                        children: [
                          AppInputText(
                            controller: _loginController.textControllerToken,
                            hintText: 'Enter Your Token',
                            keyboardType: TextInputType.text,
                            cursorColor: AppColors.authCursor,
                            prefixIcon: Image.asset("assets/images/icon_token.png",width: 30),
                          ),
                          const SizedBox(
                            height: AppSpacings.medium,
                          ),
                          Obx(() {
                            return AppButton(
                              busy: _loginController.busy.value,
                              onPressed: _loginController.verifyPhone,
                              text: 'Log In',
                            );
                          }),
                          const SizedBox(
                            height: AppSpacings.small,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                           Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Don\'t have an Account! ',
                                  style: TextStyle(fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    fontSize: AppFontSizes.medium
                                  )
                                ),
                                TextSpan(
                                    text: 'Register \n',
                                    style: const TextStyle(fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                        fontSize: AppFontSizes.medium,
                                      decoration: TextDecoration.underline,
                                    ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _loginController.gotoRegistration,
                                ),
                                 TextSpan(
                                  text: 'Copyright @ ${DateTime.now().year} TTK',
                                  style: const TextStyle(color: AppColors.primaryLight),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
