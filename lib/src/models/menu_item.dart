import 'package:flutter/cupertino.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String asset;
  final VoidCallback? onPressed;

  MenuItem({
    this.title = '',
    this.subTitle = '',
    this.asset = '',
    this.onPressed,
  });
}
