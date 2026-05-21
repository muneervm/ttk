import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/home/home_app_bar.dart';
import 'package:ttk/src/modules/home/home_page.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_dropdown_button.dart';
import 'package:ttk/src/widgets/tiny/app_elevated_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';
import 'package:ttk/src/widgets/tiny/app_round_button.dart';

class ValveManufacturerEnterPage extends StatelessWidget {
  static const routeName = '/valve_manufacturer';

  ValveManufacturerEnterPage({Key? key}) : super(key: key);

  final OrderController _controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlue,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarHeight),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Valve Two Manufacturer",
                            style: AppTextStyles.appBarTitle),
                        Text("Please select valve Manufacturer",
                            style: AppTextStyles.appSubTitle
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ],
                ))),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            children: [
              SizedBox(
                height: AppSpacings.medium,
              ),
              Obx((){
                return GestureDetector(
                  onTap: (){
                    _controller.selectValveManufacturer("ttk");
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration:
                    BoxDecoration(boxShadow: [AppShadows.shadow],color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadii.medium),
                    border: _controller.selectedValveManufacturer =="ttk" ? Border.all(color: AppColors.appBlue) : null),
                    child: Row(
                      children: [
                        SizedBox(width: AppSpacings.medium,),
                        Expanded(
                          child: Text(
                            'TTK VALVE',
                            style: AppTextStyles.appTitle.copyWith(color: AppColors.appBlue),
                            textAlign: TextAlign.left,
                          ),
                        ),
                       _controller.selectedValveManufacturer =="ttk" ? Image.asset('assets/images/selected.png',width: 70,) : SizedBox()

                      ],
                    ),
                  ),
                );
              }),
              SizedBox(
                height: AppSpacings.small,
              ),
              _controller.selectedValveType.value=="dual" ?  Obx((){
                return GestureDetector(
                  onTap: (){
                    _controller.selectValveManufacturer("other");
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration:
                    BoxDecoration(boxShadow: [AppShadows.shadow],color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadii.medium),
                        border: _controller.selectedValveManufacturer =="other" ? Border.all(color: AppColors.appBlue) : null),
                    child: Row(
                      children: [
                        SizedBox(width: AppSpacings.medium,),
                        Expanded(
                          child: Text(
                            'OTHER VALVE',
                            style: AppTextStyles.appTitle.copyWith(color: AppColors.appBlue),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        _controller.selectedValveManufacturer =="other" ? Image.asset('assets/images/selected.png',width: 70,) : SizedBox()

                      ],
                    ),
                  ),
                );
              }) : SizedBox(),
              SizedBox(
                height: AppSpacings.xxxLarge,
              ),
              AppButton(
                busy: _controller.busy.value,
                onPressed: _controller.storeValveManufacturerAndGotoNextPage,
                text: 'Next',
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
