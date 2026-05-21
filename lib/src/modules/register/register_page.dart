import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/register/register_controller.dart';
import 'package:ttk/src/widgets/custom/custom_radio.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  static const routeName = '/register';

  final _registerController = Get.find<RegisterController>();

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
              bottom: 0,
              child: Image.asset(
                'assets/images/app_bottom.png',
                fit: BoxFit.fill,
              )),
          SingleChildScrollView(
            child: Center(
              child: SizedBox(
                //padding: const EdgeInsets.all(AppPaddings.authContent),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(57),bottomRight: Radius.circular(57))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:  [
                          DottedBorder(
                            options: const RoundedRectDottedBorderOptions(
                              color: AppColors.white,
                              radius: Radius.circular(20),
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                            ),
                            child: const Text(
                              'USER ROLE',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: AppSpacings.medium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Obx((){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomRadio(text: "Dealer",onSelect: _registerController.onRoleChanged,value: "dealer",selectedValue: _registerController.role.value),
                                      CustomRadio(text: "TTK Marketing Staff",onSelect: _registerController.onRoleChanged,value: "marketing_staff",selectedValue: _registerController.role.value),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomRadio(text: "Hospital staff",onSelect: _registerController.onRoleChanged, value: "hospital_staff",selectedValue: _registerController.role.value),
                                      CustomRadio(text: "TTK Admin",onSelect: _registerController.onRoleChanged, value: "admin",selectedValue: _registerController.role.value),
                                    ],
                                  )
                                ],
                              );
                            }),
                          ),


                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPaddings.authContent),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: AppSpacings.small,
                            ),
                            AppInputText(
                              controller: _registerController.textControllerName,
                              hintText: 'First Name',
                              keyboardType: TextInputType.text,
                              cursorColor: AppColors.authCursor,
                              prefixIcon: const Icon(Icons.person),
                            ),
                            const SizedBox(
                              height: AppSpacings.small,
                            ),
                            AppInputText(
                              controller: _registerController.textControllerLastName,
                              hintText: 'Last Name',
                              keyboardType: TextInputType.text,
                              cursorColor: AppColors.authCursor,
                              prefixIcon: const Icon(Icons.person),
                            ),
                            const SizedBox(
                              height: AppSpacings.small,
                            ),
                            AppInputText(
                              controller: _registerController.textControllerEmail,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: AppColors.authCursor,
                              prefixIcon: const Icon(Icons.email),
                            ),
                            const SizedBox(
                              height: AppSpacings.small,
                            ),
                            AppInputText(
                              controller: _registerController.textControllerPhone,
                              hintText: 'Phone Number',
                              keyboardType: TextInputType.phone,
                              cursorColor: AppColors.authCursor,
                              prefixIcon: const Icon(Icons.phone_in_talk),
                            ),
                            const SizedBox(
                              height: AppSpacings.medium,
                            ),
                            Obx(() {
                              return AppButton(
                                busy: _registerController.busy.value,
                                onPressed: _registerController.register,
                                text: 'Register',
                              );
                            }),
                            const SizedBox(
                              height: AppSpacings.small,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset(
                'assets/images/app_top_wave.png',
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
