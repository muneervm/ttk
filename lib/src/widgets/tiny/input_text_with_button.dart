import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class InputTextWithButton extends StatelessWidget {
  InputTextWithButton({Key? key, this.onApply}) : super(key: key);

  final _controller = TextEditingController();

  final Function(String value)? onApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            AppRadii.medium,
          ),
          boxShadow: [AppShadows.shadow]),
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.medium),
        child: Row(
          children: [
            Expanded(
              child: AppInputText(
                controller: _controller,
                hintText: 'Enter Participation Code',
                cursorColor: AppColors.authCursor,
                shadow: false,
                radius: 0,
              ),
            ),
            AppButton(
              text: 'Verify',
              width: 110,
              height: double.maxFinite,
              style: AppButtonStyles.couponButton,
              disabledStyle: AppButtonStyles.couponButtonDisabled,
              shadow: false,
              onPressed: onApply != null
                  ? () {
                      onApply!.call(_controller.text);
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
