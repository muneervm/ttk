import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/widgets/tiny/image_view.dart';

class AppLogo extends StatelessWidget {
  final bool isBlue;
  const AppLogo({Key? key,this.isBlue = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: isBlue ? AppSizes.logoHeight : 250,
      width: isBlue ? AppSizes.logoWidth : 560,
      child: Image.asset(isBlue ? 'assets/images/logo_blue.png' :'assets/images/logo.png'),
    );
  }
}
