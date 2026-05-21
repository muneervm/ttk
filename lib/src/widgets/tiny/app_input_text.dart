import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttk/src/configs/app_styles.dart';

class AppInputText extends StatelessWidget {
  const AppInputText({
    Key? key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.prefixText,
    this.cursorColor,
    this.textAlign = TextAlign.start,
    this.border = false,
    this.shadow = true,
    this.required = false,
    this.prefixIcon,
    this.minLines,
    this.borderColor = AppColors.hint,
    this.suffixText,
    this.suffixIcon,
    this.radius = AppRadii.medium,
  }) : super(key: key);
  final String? hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Color? cursorColor;
  final String? prefixText;
  final Widget? prefixIcon;
  final String? suffixText;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final bool border;
  final Color borderColor;
  final bool shadow;
  final bool required;
  final int? minLines;
  final double radius;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide:
          border ? BorderSide(color: borderColor, width: 1) : BorderSide.none,
      borderRadius: BorderRadius.circular(radius),
    );
    return Column(
      children: [
        if(required)
        Row(
          children: [
            Text(
              '$hintText',
              style: const TextStyle(
                fontSize: AppFontSizes.xxSmall,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text("*",style: TextStyle(color: AppColors.red),)
          ],
        ),
        if(required)
        const SizedBox(
          height: AppSpacings.xSmall,
        ),
        Container(
          decoration:
              BoxDecoration(boxShadow: shadow ? [AppShadows.shadow] : null),
          child: TextField(
            controller: controller,
            style: AppTextStyles.inputText,
            keyboardType: keyboardType,
            cursorColor: cursorColor,
            textAlign: textAlign,
            maxLines: (minLines != null && minLines! > 1) ? minLines : 1,
            minLines: minLines,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixText != null || prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppPaddings.inputTextVertical,
                        horizontal: AppPaddings.inputTextHorizontal,
                      ),
                      child: prefixText != null
                          ? Text(
                              prefixText!,
                              style: AppTextStyles.inputText,
                            )
                          : prefixIcon,
                    )
                  : null,
              suffixIcon: suffixText != null || suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppPaddings.inputTextVertical,
                        horizontal: AppPaddings.inputTextHorizontal,
                      ),
                      child: suffixText != null
                          ? Text(
                              suffixText!,
                              style: AppTextStyles.inputText,
                            )
                          : suffixIcon,
                    )
                  : null,
              filled: true,
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              focusedErrorBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              fillColor: AppColors.white,
              focusColor: AppColors.white,
              hintStyle: AppTextStyles.inputHintText,
              prefixStyle: AppTextStyles.inputText,
              hintMaxLines: 1,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPaddings.inputTextHorizontal,
                vertical: AppPaddings.inputTextVertical,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
