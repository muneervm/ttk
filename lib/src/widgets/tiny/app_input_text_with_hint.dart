import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class AppInputTextWithHint extends StatelessWidget {
  const AppInputTextWithHint({
    Key? key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.prefixText,
    this.cursorColor,
    this.prefixIcon,
    this.suffixText,
    this.suffixIcon,
    this.title,
  }) : super(key: key);
  final String? hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Color? cursorColor;
  final String? title;
  final String? prefixText;
  final Widget? prefixIcon;
  final String? suffixText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            '$title',
            style: const TextStyle(
              fontSize: AppFontSizes.xxSmall,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: AppSpacings.xxSmall,
          ),
        ],
        AppInputText(
          keyboardType: keyboardType,
          cursorColor: cursorColor,
          border: true,
          shadow: false,
          controller: controller,
          borderColor: AppColors.hint,
          hintText: hintText,
          prefixText: prefixText,
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
        )
      ],
    );
  }
}
