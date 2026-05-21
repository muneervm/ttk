import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';

class ValveTypeEnterPage extends StatelessWidget {
  static const routeName = '/valve_type';

  ValveTypeEnterPage({Key? key}) : super(key: key);

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
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Valve Details",
                            style: AppTextStyles.appBarTitle),
                        Text("Please select valve type",
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
              const SizedBox(
                height: AppSpacings.medium,
              ),
              Obx((){
                return GestureDetector(
                  onTap: (){
                    _controller.selectValveType("single");
                  },
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration:
                    BoxDecoration(boxShadow: [AppShadows.shadow],color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadii.medium),
                    border: _controller.selectedValveType.value =="single" ? Border.all(color: AppColors.appBlue) : null),
                    child: Row(
                      children: [
                        const SizedBox(width: AppSpacings.medium,),
                        Expanded(
                          child: Text(
                            'Single Valve Replacement',
                            style: AppTextStyles.appTitle.copyWith(color: AppColors.appBlue),
                            textAlign: TextAlign.left,
                          ),
                        ),
                       _controller.selectedValveType.value =="single" ? Image.asset('assets/images/selected.png',width: 70,) : const SizedBox()

                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: AppSpacings.small,
              ),
              Obx((){
                return GestureDetector(
                  onTap: (){
                    _controller.selectValveType("dual");
                  },
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration:
                    BoxDecoration(boxShadow: [AppShadows.shadow],color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadii.medium),
                        border: _controller.selectedValveType.value =="dual" ? Border.all(color: AppColors.appBlue) : null),
                    child: Row(
                      children: [
                        const SizedBox(width: AppSpacings.medium,),
                        Expanded(
                          child: Text(
                            'Dual Valve Replacement',
                            style: AppTextStyles.appTitle.copyWith(color: AppColors.appBlue),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        _controller.selectedValveType.value =="dual" ? Image.asset('assets/images/selected.png',width: 70,) : const SizedBox()

                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: AppSpacings.xxxLarge,
              ),
              AppButton(
                busy: _controller.busy.value,
                onPressed: _controller.storeValveTypeAndGotoNextPage,
                text: 'Next',
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
