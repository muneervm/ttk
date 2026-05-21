import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/widgets/tiny/app_elevated_button.dart';
import 'package:ttk/src/widgets/tiny/image_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
    this.title = '',
  }) : super(key: key);

  final String title;

  final LandingController _controller = Get.find();

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddings.appBarDefault),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.person,color: AppColors.appBlue,),
                  radius: 22,
                  backgroundColor: Colors.white),
                  const SizedBox(width: AppSpacings.small,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Obx((){
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${_controller.user.value.name} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppFontSizes.xLarge,
                                color: AppColors.appBlue
                            ),
                          ),
                        );
                      }),
                      Obx((){
                        return Text(
                          _controller.user.value.type.replaceAll("_", " "),
                          style: const TextStyle(
                              fontSize: AppFontSizes.medium,
                              color: AppColors.appBlue
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            AppElevatedButton(
              onPressed: _controller.logout,
              child: const Icon(Icons.power_settings_new,color: Colors.red,),
            ),
          ],
        ),
      ),
    );
  }
}
