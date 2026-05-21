import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/widgets/tiny/app_back_button.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    this.title = const SizedBox(),
    this.toolbarHeight = AppSizes.appBarHeight,
    this.padding = AppPaddings.appBarDefault,
    this.leading,
    this.action,
    this.bottom,
    this.autoImplyLeading = true,
  }) : super(key: key);

  final Widget title;
  final double toolbarHeight;
  final double padding;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Widget? action;
  final bool autoImplyLeading;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final leadingWidth =
        canPop && autoImplyLeading ? padding + AppSizes.appBackButton : padding;
    return AppBar(
        backgroundColor: Colors.transparent,
        title: title,
        centerTitle: true,
        leadingWidth: leadingWidth,
        bottom: bottom,
        actions: [
          Center(child: action ?? const SizedBox()),
          SizedBox(
            width: padding,
          )
        ],
        toolbarHeight: preferredSize.height,
        leading: Row(
          children: [
            SizedBox(
              width: padding,
            ),
            if (canPop && autoImplyLeading)
              leading ?? AppBackButton(onPressed: Navigator.of(context).pop)
          ],
        ));
  }
}
