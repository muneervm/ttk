import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';

class RegisterSuccessDialog extends StatelessWidget {
  const RegisterSuccessDialog({Key? key, this.gotoHome}) : super(key: key);

  final VoidCallback? gotoHome;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.xxxLarge),
        child: OverflowBox(
          maxHeight: 400,
          minHeight: 300,
          child: Container(
            height: 280,
            padding: const EdgeInsets.all(AppPaddings.xxxLarge),
            decoration: BoxDecoration(
                boxShadow: [AppShadows.shadow],
                borderRadius: BorderRadius.circular(AppRadii.medium),
                color: AppColors.white),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset('assets/images/check.png',color: AppColors.primary),
                  ),
                ),
                const SizedBox(
                  height: AppSpacings.medium,
                ),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Registration Successfully, Check your mail for further instructions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBlue
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSpacings.xxSmall,
                ),
                const SizedBox(
                  height: AppSpacings.medium,
                ),
                AppButton(
                  text: 'OK',
                  onPressed: gotoHome,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}