import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/home/home_app_bar.dart';
import 'package:ttk/src/modules/home/home_page.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/widgets/custom/app_app_bar.dart';
import 'package:ttk/src/widgets/tiny/app_elevated_button.dart';
import 'package:ttk/src/widgets/tiny/image_view.dart';

class LandingPage extends StatelessWidget {
  static const routeName = '/landing';

  LandingPage({Key? key}) : super(key: key);

  final LandingController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarHeight),
        child: HomeAppBar(),
      ),
      body: HomePage(),
      floatingActionButton: FloatingActionButton.extended(onPressed: _controller.gotoNewOrderPage,
          backgroundColor: AppColors.primary,
          icon: const Icon(Icons.add,color: Colors.white,),
      label: Text("Add New Patient",style: TextStyle(color: Colors.white),),),
    );
  }
}
