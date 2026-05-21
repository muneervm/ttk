import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';

class AppDropDownButton<T> extends StatefulWidget {
  const AppDropDownButton({
    Key? key,
    this.selectedItemBuilder,
    this.value,
    this.items,
    this.shadow = false,
    this.required = false,
    this.title,
    this.onChanged,
  }) : super(key: key);

  final DropdownButtonBuilder? selectedItemBuilder;

  final T? value;

  final List<DropdownMenuItem<T>>? items;

  final bool shadow;
  final bool required;

  final String? title;

  final ValueChanged<T>? onChanged;

  @override
  State<AppDropDownButton<T>> createState() => _AppDropDownButtonState<T>();
}

class _AppDropDownButtonState<T> extends State<AppDropDownButton<T>> {
  T? value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Row(
            children: [
              Text(
                '${widget.title}',
                style: const TextStyle(
                  fontSize: AppFontSizes.xxSmall,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.required)
              Text("*",style: TextStyle(color: AppColors.red),)
            ],
          ),
          const SizedBox(
            height: AppSpacings.xSmall,
          ),
        ],
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.large, vertical: 0),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadii.large),
              border: Border.all(
                color: AppColors.hint,
              ),
              boxShadow: widget.shadow ? [AppShadows.shadow] : null),
          child: DropdownButton<T>(
            value: value,
            selectedItemBuilder: widget.selectedItemBuilder,
            icon: Transform.rotate(
              angle: -(90 * 3.14 / 180),
              child: const Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.hint,
                size: 20,
              ),
            ),
            iconSize: 24,
            elevation: 8,
            borderRadius: BorderRadius.circular(AppRadii.medium),
            isExpanded: true,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: AppFontSizes.medium,
              fontFamily: AppFonts.primaryFontFamily,
            ),
            underline: const SizedBox(),
            onChanged: (e) {
              setState(() {
                value = e;
              });
              if (widget.onChanged != null) {
                widget.onChanged!.call(e!);
              }
            },
            items: widget.items,
          ),
        ),
      ],
    );
  }
}
