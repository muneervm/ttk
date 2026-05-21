import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class ValveOtherDetailEnterPage extends StatelessWidget {
  static const routeName = '/valve_other';

  ValveOtherDetailEnterPage({Key? key}) : super(key: key);

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
                        const Text("Other Valve Details",
                            style: AppTextStyles.appBarTitle),
                        Text("Please enter valve details",
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
              AppInputText(
                controller: _controller.textControllerValveDetail,
                minLines: 6,
                shadow: true,
                border: true,
                hintText: "Enter Other Valve Details",
              ),
              const SizedBox(
                height: AppSpacings.xxxLarge,
              ),
              Obx((){
                return AppButton(
                  busy: _controller.busy.value,
                  onPressed: _controller.submit,
                  text: 'Submit',
                );
              }),
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
